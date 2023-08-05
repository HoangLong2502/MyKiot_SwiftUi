//
//  ProductScanPage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 25/07/2023.
//

import SwiftUI
import AVKit

struct ProductScanPage: View {
    @State private var isScanning: Bool = true
    @State private var session: AVCaptureSession = .init()
    @State private var cameraPermission: CameraPermisstion = .idle
    /// QR Scanner AV Output
    @State private var qrOutput: AVCaptureMetadataOutput = .init()
    /// Error message
    @State private var errorMessage: String = ""
    @State private var showError: Bool = false
    
    @Environment(\.openURL) private var openURL
    
    ///Camera QR Output Delegate
    @StateObject private var barCodeDelegate: BarCodeScanDelegate = BarCodeScanDelegate()
    @State private var scannedCode: String = ""
    
    let onConfirm: ((_ barCode: String?) -> Void)?
    
    init(onConfirm: ((_: String?) -> Void)? = nil) {
        self.onConfirm = onConfirm
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: Sp.s8) {
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                        .foregroundColor(Color.main)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Đưa mã vạch vào trong vùng quét")
                    .font(.title3)
                    .foregroundColor(Color.blackSystem.opacity(0.8))
                    .padding(.top, Sp.s20)
                
                Text("Tự dộng quét mã vạch")
                    .font(.callout)
                    .foregroundColor(Color.grey)
                
                Spacer(minLength: 0)
                
                //MARK: Scanner
                GeometryReader {
                    let size = $0.size
                    
                    ZStack {
                        CameraView(frameSize: CGSize(width: size.width, height: size.width), session: $session)
                        
                        ForEach(0...4, id: \.self) { index in
                            let rotation = Double(index) * 90
                            
                            RoundedRectangle(cornerRadius: Sp.s8, style: .circular)
                                .trim(from: 0.6, to: 0.65)
                                .stroke(Color.main, style: StrokeStyle(
                                    lineWidth: Sp.s4,
                                    lineCap: .round,
                                    lineJoin: .round
                                ))
                                .rotationEffect(.init(degrees: rotation)
                            )
                        }
                    }
                    /// Sqaure Shape
                    .frame(width: size.width, height: size.width)
                    /// Scan Animation
                    .overlay(alignment: .top, content: {
                        Rectangle()
                            .fill(Color.main)
                            .frame(height: 2.5)
                            .shadow(color: Color.blackSystem.opacity(0.8), radius: 8, x: 0, y: isScanning ? Sp.s14 : -Sp.s14)
                            .offset(y: isScanning ?  size.width : 0)
                    })
                    /// To Make it Center
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(.horizontal, Sp.s48)
                
                Spacer(minLength: Sp.s16)
                
                Button {
                    if !session.isRunning && cameraPermission == .approved {
                        activateScannerAnimation()
                        activateCameraScanning()
                    }
                } label: {
                     Image(systemName: "qrcode.viewfinder")
                        .font(.largeTitle)
                        .foregroundColor(Color.grey)
                }
                
                Spacer(minLength: Sp.s16)
                
                
            }
            .padding(Sp.s16)
            .onAppear(perform: checkCameraPermission)
            .alert(errorMessage ,isPresented: $showError) {
                /// Showing Setting Button,  if permission is denied
                if cameraPermission == .denied {
                    Button("Settings") {
                        let settingsString = UIApplication.openSettingsURLString
                        if let seetingsURL = URL(string: settingsString) {
                            /// Opening App's Setting, Using openURL SwiftUi API
                            openURL(seetingsURL)
                        }
                    }
                    
                    Button("Cencel", role: .cancel) {
                        
                    }
                }
            }
            .onChange(of: barCodeDelegate.scannedCode) { newValue in
                if let code = newValue {
                    scannedCode = code
                    session.stopRunning()
                    deActivateScannerAnimation()
                    barCodeDelegate.scannedCode = nil
                    onConfirm?(newValue)
                }
            }
        }
    }
    
    func activateCameraScanning() {
        DispatchQueue.global(qos: .background).sync {
            session.startRunning()
        }
    }
    
    /// Activating Scanner Animation Method
    func activateScannerAnimation() {
        withAnimation(.easeInOut(duration: 0.85).delay(0.1).repeatForever(autoreverses: true)) {
            isScanning.toggle()
        }
    }
    
    /// De-Activating Scanner Animation Method
    func deActivateScannerAnimation() {
        withAnimation(.easeInOut(duration: 0.85)) {
            isScanning = false
        }
    }
    
    /// Checking Camera Permission
    func checkCameraPermission() {
        Task {
            switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                cameraPermission = .approved
                setupCamera()
            case .notDetermined:
                if await AVCaptureDevice.requestAccess(for: .video) {
                    cameraPermission = .approved
                    setupCamera()
                } else {
                    cameraPermission = .denied
                    presentError("Chấp nhận quyền truy cập Camera để quét")
                }
            case .denied, .restricted:
                cameraPermission = .denied
                presentError("Chấp nhận quyền truy cập Camera để quét")
            default: break
            }
        }
    }
    
    /// Setting Up Camera
    func setupCamera() {
        do {
            /// Finding Back Camera
            guard let device = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back).devices.first else {
                presentError("UNKNOWN DEVICE ERROR")
                return
            }
            /// Camera Input
            let input = try AVCaptureDeviceInput(device: device)
            /// For Extra Saftey
            /// Checking Wheter input & output can be added to the session
            guard session.canAddInput(input), session.canAddOutput(qrOutput) else {
                presentError("UNKNOWN INPUT/OUTPUT ERROR")
                return
            }
            
            /// Adding Input & ouput to Camera Session
            session.beginConfiguration()
            session.addInput(input)
            session.addOutput(qrOutput)
            
            /// Setting Output config to read barCode
            qrOutput.metadataObjectTypes = [.ean13, .upce]
            
            /// Adding Delegate to Retreive the Fetched barCode from Camera
            qrOutput.setMetadataObjectsDelegate(barCodeDelegate, queue: .main)
            session.commitConfiguration()
            
            /// Note Session must be started on Background thread
            DispatchQueue.global(qos: .background).async {
                session.startRunning()
            }
            activateScannerAnimation()
        } catch {
            presentError(error.localizedDescription)
        }
    }
    
    /// Presenting Error
    func presentError(_ message: String) {
        errorMessage = message
        showError.toggle()
    }
}

struct ProductScanPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductScanPage()
    }
}

enum CameraPermisstion: String {
    case idle = "Not Determined"
    case approved = "Access Granted"
    case denied = "Access Denied"
}

//
//  CameraView.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 25/07/2023.
//

import SwiftUI
import AVKit

/// Camera View Using AVCaptureVideoPreviewLayer
struct CameraView: UIViewRepresentable {
    var frameSize: CGSize
    
    /// Camera Session
    @Binding var session: AVCaptureSession
    
    func makeUIView(context: Context) -> UIView {
        /// Defining Camera Frame Size
        let view = UIViewType(frame: CGRect(origin: .zero, size: frameSize))
        view.backgroundColor = .clear
        
        let cameraLayer = AVCaptureVideoPreviewLayer(session: session)
        cameraLayer.frame = .init(origin: .zero, size: frameSize)
        cameraLayer.masksToBounds = true
        view.layer.addSublayer(cameraLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

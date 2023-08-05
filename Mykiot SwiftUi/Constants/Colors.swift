//
//  Colors.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 13/07/2023.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
    //MARK: - Main Color
    static let main = Color(hex: 0xEF5149)
    
    //MARK: - Accent Color
    static let accent_1 = Color(hex: 0xFFF2746D)
    static let accent_2 = Color(hex: 0xFFF59792)
    static let accent_3 = Color(hex: 0xFFF9B9B6)
    static let accent_4 = Color(hex: 0xFFFCDCDB)
    static let accent_5 = Color(hex: 0xFFD74942)
    static let accent_6 = Color(hex: 0xFFC2423B)
    static let accent_7 = Color(hex: 0xFFAE3B35)
    static let accent_8 = Color(hex: 0xFF9D3530)
    
    static let blackSystem = Color(hex: 0x292929)
    static let grey = Color(hex: 0xAAAAAA)
    
    static let blue_1 = Color(hex: 0x499FEF)
    static let blue_2 = Color(hex: 0xEDF6FE)
    static let red_1 = Color(hex: 0xEF4949)
    static let red_2 = Color(hex: 0xFEEDED)
    static let green_1 = Color(hex: 0x49EF9F)
    static let green_2 = Color(hex: 0xEDFEF6)
    static let yellow_1 = Color(hex: 0xEF9949)
    static let yellow_2 = Color(hex: 0xFEF5ED)
    
    //MARK: - Border Color
    static let border_1 = Color(hex: 0xF5F5F5)
    static let border_2 = Color(hex: 0xE2E2E2)
    static let border_3 = Color(hex: 0xAAAAAA)
    static let border_4 = Color(hex: 0x797777)
    
    //MARK: - Background Color
    static let bg_1 = Color(hex: 0xFF686868)
    static let bg_4 = Color(hex: 0xF5F5F5)
}

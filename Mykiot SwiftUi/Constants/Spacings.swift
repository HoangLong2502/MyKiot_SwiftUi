//
//  Spacing.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 13/07/2023.
//

import Foundation
import SwiftUI

extension CGFloat {
    static let sp12 = 12
}

class Sp {
    static let s4 : CGFloat = 4
    static let s8 : CGFloat = 8
    static let s12 : CGFloat = 12
    static let s14 : CGFloat = 14
    static let s16 : CGFloat = 16
    static let s18 : CGFloat = 18
    static let s20 : CGFloat = 20
    static let s24 : CGFloat = 24
    static let s28 : CGFloat = 28
    static let s32 : CGFloat = 32
    static let s48 : CGFloat = 48
    static let s56 : CGFloat = 56
    static let s64 : CGFloat = 64
    
    // MARK: Spacing Horizonal
    static let w4: some View = Spacer().frame(width: Sp.s4)
    
    // MARK: Spacing Vertical
    static let h4: some View = Spacer().frame(height: Sp.s4)
    static let h16: some View = Spacer().frame(height: Sp.s16)
    static let h24: some View = Spacer().frame(height: Sp.s24)
}



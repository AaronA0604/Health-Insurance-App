//
//  WheelButtonAnchorKey.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/31/26.
//

import Foundation
import SwiftUI


struct WheelAnchorKey: PreferenceKey {
    static var defaultValue: [ActiveWheel: Anchor<CGRect>] = [:]
    
    static func reduce(
        value: inout [ActiveWheel: Anchor<CGRect>],
        nextValue: () -> [ActiveWheel: Anchor<CGRect>]
    ) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}



//struct WheelButtonAnchorKey: PreferenceKey {
//    static var defaultValue: [WheelType: Anchor<CGRect>] = [:]
//    
//    static func reduce(
//        value: inout [WheelType: Anchor<CGRect>],
//        nextValue: () -> [WheelType: Anchor<CGRect>]
//    ) {
//        value.merge(nextValue(), uniquingKeysWith: { $1 })
//    }
//}
//
//struct DoubleWheelAnchorKey: PreferenceKey {
//    static var defaultValue: Anchor<CGRect>? = nil
//    
//    static func reduce(
//        value: inout Anchor<CGRect>?,
//        nextValue: () -> Anchor<CGRect>?
//    ) {
//        value = nextValue() ?? value
//    }
//}

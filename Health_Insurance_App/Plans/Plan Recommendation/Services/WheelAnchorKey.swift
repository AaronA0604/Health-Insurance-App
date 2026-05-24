//
//  WheelAnchorKey.swift
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

//
//  UtilizationFit.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 4/23/26.
//

import Foundation

enum UtilizationFit: String, Identifiable, CaseIterable, Hashable {
    case low
    case medium
    case high
    case veryHigh
    
    var id: String {
        rawValue
    }
}

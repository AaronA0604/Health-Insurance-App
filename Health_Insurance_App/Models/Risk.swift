//
//  Border.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/15/26.
//

import Foundation
import SwiftUI

enum Risk: String, Identifiable, CaseIterable {
    case highestRisk
    case highRisk
    case recommended
    case lowRisk
    case lowestRisk
    
    var id: String {
        rawValue
    }
    
    var border: Color {
        switch self {
        case .highestRisk:
            return .orange
        case .highRisk:
            return .orange
        case .recommended:
            return .blue
        case .lowRisk:
            return .yellow
        case .lowestRisk:
            return .yellow
        }
    }
}

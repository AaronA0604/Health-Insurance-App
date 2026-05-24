//
//  MetalTier.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 5/22/26.
//

import Foundation

enum MetalTier: String, Identifiable, CaseIterable {
    case catastrophic
    case bronze
    case silver
    case gold
    case platinum
    
    var id: String {
        rawValue
    }
}

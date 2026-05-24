//
//  DrugCoverage.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 4/23/26.
//

import Foundation

enum DrugCoverage: String, Identifiable, CaseIterable {
    case poor
    case standard
    case strong
    case veryStrong
    
    var id: String {
        rawValue
    }
}

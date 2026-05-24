//
//  CoverageStrength.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 5/22/26.
//

import Foundation

import Foundation

enum CoverageStrength: String, Identifiable, CaseIterable {
    case weak
    case standard
    case strong
    
    var id: String {
        rawValue
    }
}

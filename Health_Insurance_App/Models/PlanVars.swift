//
//  DetermisticEngine.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/14/26.
//

import Foundation

struct PlanVars: Identifiable {
    let id = UUID()
    
    var planName: String
    var coName: String
    var deductible: Decimal
    var premium: Decimal
    var isRecommended: Bool
    // TODO: add other variables as needed
}

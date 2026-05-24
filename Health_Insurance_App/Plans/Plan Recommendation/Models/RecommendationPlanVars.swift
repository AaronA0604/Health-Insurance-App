//
//  RecommendationPlanVars.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/14/26.
//

import Foundation

struct RecommendationPlanVars {
    let id: String
    // TODO: make id a UUID() that persists through a database
    var planName: String
    var coName: String
    var deductible: Decimal
    var premium: Decimal
    var isRecommended: Bool
    var url: String
    // TODO: add other variables as needed
}

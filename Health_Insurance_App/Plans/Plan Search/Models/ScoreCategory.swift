//
//  ScoreCategory.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 8/25/26.
//

import Foundation

// TODO: see if this file should be created via a view model that maps the variables from PlanVars
enum ScoreCategory {
    case networkType(NetworkType)    // type of network
    case riskProfile(RiskProfile)    // overall financial exposure + cost structure
    case drugCoverage(DrugCoverage)  // how good the prescription coverage is
    case utilizationFit(UtilizationFit)  // what usage level the plan is optimized for
    case coverageScope(CoverageScope)   // how large the coverage area is
}

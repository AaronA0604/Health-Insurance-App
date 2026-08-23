//
//  ScoreDictionary.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 8/23/26.
//

import Foundation

struct ScoreDictionary {
    // network type score dictionary
    var networkType: [NetworkType: Int] = Dictionary(
        uniqueKeysWithValues: NetworkType.allCases.map { ($0, 0) }
    )
    
    // risk profile score dictionary
    var riskProfile: [RiskProfile: Int] = Dictionary(
        uniqueKeysWithValues: RiskProfile.allCases.map { ($0, 0) }
    )
    
    // drug coverage score dictionary
    var drugCoverage: [DrugCoverage: Int] = Dictionary(
        uniqueKeysWithValues: DrugCoverage.allCases.map { ($0, 0) }
    )
    
    // utilization fit score dictionary
    var utilizationFit: [UtilizationFit: Int] = Dictionary(
        uniqueKeysWithValues: UtilizationFit.allCases.map { ($0, 0) }
    )
    
    // coverage scope score dictionary
    var coverageScope: [CoverageScope: Int] = Dictionary(
        uniqueKeysWithValues: CoverageScope.allCases.map { ($0, 0) }
    )
}

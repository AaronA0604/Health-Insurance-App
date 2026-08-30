//
//  PlanFilteringEngine.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 8/24/26.
//

import Foundation
internal import Combine

class PlanFilteringEngine {
    // list of variables for plans that match the user's preferences
    @Published private(set) var qualifyingKeys: [ScoreCategory] = []
    
    var scores = ScoreDictionary()
    var vm = PlansViewModel()

    // add variables to array based on scores
    func updateQualifyingVars() {
        qualifyingKeys.removeAll() // avoid duplicates if called more than once
        
        // network type
        for (key, value) in scores.networkType where value >= 14 {
            qualifyingKeys.append(.networkType(key))
        }
        
        // risk profile
        for (key, value) in scores.riskProfile where value >= 5 {
            qualifyingKeys.append(.riskProfile(key))
        }
        
        // drug coverage
        for (key, value) in scores.drugCoverage where value >= 5 {
            qualifyingKeys.append(.drugCoverage(key))
        }
        
        // utilization fit
        for (key, value) in scores.utilizationFit where value >= 4 {
            qualifyingKeys.append(.utilizationFit(key))
        }
        
        // coverage scope
        for (key, value) in scores.coverageScope where value >= 5 {
            qualifyingKeys.append(.coverageScope(key))
        }
        
        vm.filterPlans()
    }
}

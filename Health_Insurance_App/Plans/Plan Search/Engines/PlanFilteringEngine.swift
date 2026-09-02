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
    // list of plans that match the user's preferences
    @Published private(set) var filteredPlans: [PlanVars] = []
    
    var scores = ScoreDictionary()
    private let allPlans: [PlanVars] = SamplePlans.plans

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
        
        // call function to add plans to array
        filterPlans()
    }
    
    // add plans to array based on keys
    func filterPlans() {
        var networkTypeKeys: Set<NetworkType> = []
        var riskProfileKeys: Set<RiskProfile> = []
        var drugCoverageKeys: Set<DrugCoverage> = []
        var utilizationFitKeys: Set<UtilizationFit> = []
        var coverageScopeKeys: Set<CoverageScope> = []

        for key in qualifyingKeys {
            switch key {
            case .networkType(let value):
                networkTypeKeys.insert(value)
            case .riskProfile(let value):
                riskProfileKeys.insert(value)
            case .drugCoverage(let value):
                drugCoverageKeys.insert(value)
            case .utilizationFit(let value):
                utilizationFitKeys.insert(value)
            case .coverageScope(let value):
                coverageScopeKeys.insert(value)
            }
        }

        filteredPlans = allPlans.filter { plan in
            networkTypeKeys.contains(plan.networkType)
            && riskProfileKeys.contains(plan.riskProfile)
            && drugCoverageKeys.contains(plan.drugCoverage)
            && utilizationFitKeys.contains(plan.utilizationFit)
            && coverageScopeKeys.contains(plan.coverageScope)
        }
    }
}

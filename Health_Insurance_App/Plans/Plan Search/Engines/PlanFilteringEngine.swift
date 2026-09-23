//
//  PlanFilteringEngine.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 8/24/26.
//

import Foundation
internal import Combine

final class PlanFilteringEngine {
    // MARK: Add scores to dictionary
    func updateScores(selectedAnswers: [Int: Answer]) -> ScoreDictionary {
        var scores = ScoreDictionary()
        
        for (_, answer) in selectedAnswers {
            for (networkType, points) in answer.scoreChanges.networkType {
                scores.networkType[networkType, default: 0] += points
            }
            
            for (riskProfile, points) in answer.scoreChanges.riskProfile {
                scores.riskProfile[riskProfile, default: 0] += points
            }
            
            for (drugCoverage, points) in answer.scoreChanges.drugCoverage {
                scores.drugCoverage[drugCoverage, default: 0] += points
            }
            
            for (utilizationFit, points) in answer.scoreChanges.utilizationFit {
                scores.utilizationFit[utilizationFit, default: 0] += points
            }
            
            for (coverageScope, points) in answer.scoreChanges.coverageScope {
                scores.coverageScope[coverageScope, default: 0] += points
            }
        }
        
        return scores
    }
    
    // MARK: Add keys to array
    private func updateQualifyingKeys(scores: ScoreDictionary) -> [ScoreCategory] {
        var keys: [ScoreCategory] = []
        
        // network type
        if scores.networkType.values.allSatisfy({ $0 == 0 }) {
            for key in scores.networkType.keys {
                keys.append(.networkType(key))
            }
        } else {
            for (key, value) in scores.networkType where value >= 14 {
                keys.append(.networkType(key))
            }
        }
        
        // risk profile
        if scores.riskProfile.values.allSatisfy({ $0 == 0 }) {
            for key in scores.riskProfile.keys {
                keys.append(.riskProfile(key))
            }
        } else {
            for (key, value) in scores.riskProfile where value >= 5 {
                keys.append(.riskProfile(key))
            }
        }
        
        // drug coverage
        if scores.drugCoverage.values.allSatisfy({ $0 == 0 }) {
            for key in scores.drugCoverage.keys {
                keys.append(.drugCoverage(key))
            }
        } else {
            for (key, value) in scores.drugCoverage where value >= 5 {
                keys.append(.drugCoverage(key))
            }
        }
        
        // utilization fit
        if scores.utilizationFit.values.allSatisfy({ $0 == 0 }) {
            for key in scores.utilizationFit.keys {
                keys.append(.utilizationFit(key))
            }
        } else {
            for (key, value) in scores.utilizationFit where value >= 5 {
                keys.append(.utilizationFit(key))
            }
        }
        
        // coverage scope
        if scores.coverageScope.values.allSatisfy({ $0 == 0 }) {
            for key in scores.coverageScope.keys {
                keys.append(.coverageScope(key))
            }
        } else {
            for (key, value) in scores.coverageScope where value >= 5 {
                keys.append(.coverageScope(key))
            }
        }
                
        return keys
    }
    
    // MARK: Add plans to array
    func filterPlans(scores: ScoreDictionary) -> [PlanVars] {
        // list of all the plans
        let allPlans: [PlanVars] = SamplePlans.plans
        
        let keys = updateQualifyingKeys(scores: scores)
        
        var networkTypeKeys: Set<NetworkType> = []
        var riskProfileKeys: Set<RiskProfile> = []
        var drugCoverageKeys: Set<DrugCoverage> = []
        var utilizationFitKeys: Set<UtilizationFit> = []
        var coverageScopeKeys: Set<CoverageScope> = []

        for key in keys {
            switch key {
            case .networkType(let value): networkTypeKeys.insert(value)
            case .riskProfile(let value): riskProfileKeys.insert(value)
            case .drugCoverage(let value): drugCoverageKeys.insert(value)
            case .utilizationFit(let value): utilizationFitKeys.insert(value)
            case .coverageScope(let value): coverageScopeKeys.insert(value)
            }
        }

        let filtered = allPlans.filter { plan in
            networkTypeKeys.contains(plan.networkType)
            && riskProfileKeys.contains(plan.riskProfile)
            && drugCoverageKeys.contains(plan.drugCoverage)
            && utilizationFitKeys.contains(plan.utilizationFit)
            && coverageScopeKeys.contains(plan.coverageScope)
        }
                
        return filtered
    }
}

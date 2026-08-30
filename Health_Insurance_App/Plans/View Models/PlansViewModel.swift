//
//  PlansModelView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/28/26.
//

import Foundation
import SwiftUI
internal import Combine

@MainActor
class PlansViewModel: ObservableObject {
    @Published private(set) var recommendedPlans: [RecommendationPlanVars] = []
    @Published private(set) var filteredPlans: [PlanVars] = []
    
    private let allPlans: [PlanVars] = SamplePlans.plans
    private let engine = PlanFilteringEngine()

    // output the variables for each recommended plan card
    var recommendationCardModels: [RecommendationCardVars] {
        recommendedPlans.map { plan in
            RecommendationCardVars(
                id: plan.id,
                planName: plan.planName,
                deductible: plan.deductible,
                premium: plan.premium,
                isRecommended: plan.isRecommended
            )
        }
    }
    
    // output the variables for each filtered plan card
    var planCardModels: [PlanCardVars] {
        filteredPlans.map { plan in
            PlanCardVars(
                id: plan.id,
                planName: plan.planName,
                deductible: plan.deductible,
                premium: plan.premium
            )
        }
    }

    init() {
        // TODO: make this line not part of initializer, but part of function
        // TODO: Replace with deterministic engine call
        self.recommendedPlans = DeterministicEngine.sample
    }
    
    // output filtered plans
    func filterPlans() {
        var networkTypeKeys: Set<NetworkType> = []
        var riskProfileKeys: Set<RiskProfile> = []
        var drugCoverageKeys: Set<DrugCoverage> = []
        var utilizationFitKeys: Set<UtilizationFit> = []
        var coverageScopeKeys: Set<CoverageScope> = []

        for key in engine.qualifyingKeys {
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

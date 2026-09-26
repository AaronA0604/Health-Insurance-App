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
    private let engine = PlanFilteringEngine()
    
    @Published private(set) var filteredPlans: [PlanVars] = []
    @Published private(set) var recommendedPlans: [RecommendationPlanVars] = []
    
    @Published var currentSort: SortingFactors = .premium

    // output the variables for each recommended plan card
    var recommendationCardModels: [RecommendationCardVars] {
        recommendedPlans.map { plan in
            RecommendationCardVars(
                id: plan.id,
                planName: plan.planName,
                coName: plan.coName,
                deductible: plan.deductible,
                premium: plan.premium,
                url: plan.url,
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
                premium: plan.premium,
            )
        }
    }
    
    func refresh(scores: ScoreDictionary) {
        filteredPlans = engine.filterPlans(scores: scores)
        sortPlans(by: .premium)
    }
    
    // sort plans for plan search page
    func sortPlans(by sortingFactor: SortingFactors) {
        currentSort = sortingFactor
        switch sortingFactor {
        case .premium:
            filteredPlans.sort { $0.premium < $1.premium }
        case .deductible:
            filteredPlans.sort { $0.deductible < $1.deductible }
        case .provider:
            filteredPlans.sort { $0.coName < $1.coName }
        }
    }

    init() {
        // TODO: make this line not part of initializer, but part of function
        // TODO: Replace with deterministic engine call
        self.recommendedPlans = DeterministicEngine.sample
    }
}

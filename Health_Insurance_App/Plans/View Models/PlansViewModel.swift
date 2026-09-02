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
    
    @Published private(set) var recommendedPlans: [RecommendationPlanVars] = []

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
        engine.filteredPlans.map { plan in
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
}

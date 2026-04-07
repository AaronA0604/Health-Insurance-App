//
//  RecommendationModelView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/28/26.
//

import Foundation
import SwiftUI
internal import Combine

@MainActor
class RecommendationViewModel: ObservableObject {

    @Published private(set) var plans: [PlanVars] = []

    var cardModels: [RecommendationCardVars] {
        plans.map { plan in
            RecommendationCardVars(
                planName: plan.planName,
                deductible: plan.deductible,
                premium: plan.premium,
                isRecommended: plan.isRecommended
            )
        }
    }

    init() {
        // TODO: Replace with deterministic engine call
        self.plans = DeterministicEngine.sample
    }
}

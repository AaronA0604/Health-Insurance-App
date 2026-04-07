//
//  ReviewManager.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/14/26.
//

import Foundation
import SwiftUI
internal import Combine

class ReviewManager: ObservableObject {
    @Published var reviews: [Review] = []
    @Published var selectedPlanID: String? = nil
    
    // Add review
    func addReview(planID: String, netCov: Int, netCovText: String, com: Int, comText: String, service: Int, serviceText: String) {
        let review = Review(
            planID: planID,
            date: Date(),
            netCov: netCov,
            netCovText: netCovText,
            com: com,
            comText: comText,
            service: service,
            serviceText: serviceText
        )
        
        reviews.append(review)
    }
    
    // Filter reviews
    var filteredReviews: [Review] {
        guard let selectedPlanID else {
            return reviews
        }
        return reviews.filter {
            $0.planID == selectedPlanID
        }
    }
}

// Sample reviews for the preview only
extension ReviewManager {
    static var preview: ReviewManager {
        let manager = ReviewManager()
        
        manager.addReview(
            planID: "samplePlan",
            netCov: 5,
            netCovText: "There is a wide network of doctors that accepts this plan and I had no trouble finding one near me.",
            com: 4,
            comText: "Mainly there was clear communication, but at some points there was not.",
            service: 5,
            serviceText: "There was excellent costumer support."
        )
        
        manager.addReview(
            planID: "samplePlan",
            netCov: 3,
            netCovText: "There were limited specialists that accepted this plan.",
            com: 3,
            comText: "They were sometimes unclear and I couldn't understand them.",
            service: 4,
            serviceText: "They were helpful, however, they were slow to help."
        )
        
        return manager
    }
}

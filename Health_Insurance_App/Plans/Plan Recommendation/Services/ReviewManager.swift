//
//  ReviewManager.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/14/26.
//

import Foundation
import SwiftUI
internal import Combine

// TODO: change logic so that it appends the reviews to a backend database
class ReviewManager: ObservableObject {
    @Published var reviews: [Review] = []
    @Published var selectedPlanID: String?
    
    private var isPreview: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
        
    init() {
        if isPreview {
            loadPreviewData()
        }
    }
    
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
            return []
        }
        
        return reviews.filter {
            $0.planID == selectedPlanID
        }
    }
    
    // Sample reviews for preview only
    private func loadPreviewData() {
        // Reviews for first plan
        addReview(
            planID: "001",
            netCov: 5,
            netCovText: "There is a wide network of doctors that accepts this plan and I had no trouble finding one near me.",
            com: 4,
            comText: "Mainly there was clear communication, but at some points there was not.",
            service: 5,
            serviceText: "There was excellent costumer support."
        )
        
        addReview(
            planID: "001",
            netCov: 3,
            netCovText: "There were limited specialists that accepted this plan.",
            com: 3,
            comText: "They were sometimes unclear and I couldn't understand them.",
            service: 4,
            serviceText: "They were helpful, however, they were slow to help."
        )
        
        // Reviews for second plan
        addReview(
            planID: "002",
            netCov: 5,
            netCovText: "There is a wide network of doctors that accepts this plan and I had no trouble finding one near me.",
            com: 4,
            comText: "Mainly there was clear communication, but at some points there was not.",
            service: 5,
            serviceText: "There was excellent costumer support."
        )
        
        addReview(
            planID: "002",
            netCov: 3,
            netCovText: "There were limited specialists that accepted this plan.",
            com: 3,
            comText: "They were sometimes unclear and I couldn't understand them.",
            service: 4,
            serviceText: "They were helpful, however, they were slow to help."
        )
        
        // Reviews for third plan
        addReview(
            planID: "003",
            netCov: 5,
            netCovText: "There is a wide network of doctors that accepts this plan and I had no trouble finding one near me.",
            com: 4,
            comText: "Mainly there was clear communication, but at some points there was not.",
            service: 5,
            serviceText: "There was excellent costumer support."
        )
        
        addReview(
            planID: "003",
            netCov: 3,
            netCovText: "There were limited specialists that accepted this plan.",
            com: 3,
            comText: "They were sometimes unclear and I couldn't understand them.",
            service: 4,
            serviceText: "They were helpful, however, they were slow to help."
        )
        
        // Reviews for fourth plan
        addReview(
            planID: "004",
            netCov: 5,
            netCovText: "There is a wide network of doctors that accepts this plan and I had no trouble finding one near me.",
            com: 4,
            comText: "Mainly there was clear communication, but at some points there was not.",
            service: 5,
            serviceText: "There was excellent costumer support."
        )
        
        addReview(
            planID: "004",
            netCov: 3,
            netCovText: "There were limited specialists that accepted this plan.",
            com: 3,
            comText: "They were sometimes unclear and I couldn't understand them.",
            service: 4,
            serviceText: "They were helpful, however, they were slow to help."
        )
        
        // Reviews for fifth plan
        addReview(
            planID: "005",
            netCov: 5,
            netCovText: "There is a wide network of doctors that accepts this plan and I had no trouble finding one near me.",
            com: 4,
            comText: "Mainly there was clear communication, but at some points there was not.",
            service: 5,
            serviceText: "There was excellent costumer support."
        )
        
        addReview(
            planID: "005",
            netCov: 3,
            netCovText: "There were limited specialists that accepted this plan.",
            com: 3,
            comText: "They were sometimes unclear and I couldn't understand them.",
            service: 4,
            serviceText: "They were helpful, however, they were slow to help."
        )
    }
}

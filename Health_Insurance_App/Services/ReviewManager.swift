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
    func reviews(for planID: String) -> [Review] {
        reviews.filter { $0.planID == planID }
    }
}

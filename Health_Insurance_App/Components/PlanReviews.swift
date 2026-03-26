//
//  PlanReviews.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/13/26.
//

import SwiftUI

struct PlanReviews: View {
    @EnvironmentObject var reviewManager: ReviewManager
    let planID: String
    
    var body: some View {
        List {
            ForEach(reviewManager.reviews(for: planID), id: \.id) { review in
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text("Network Coverage: \(review.netCov)")
                    Text(review.netCovText)
                    Text("Communication: \(review.com)")
                    Text(review.comText)
                    Text("Customer Service: \(review.service)")
                    Text(review.serviceText)
                    
                    Text(review.date, style: .date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
            }
        }
    }
}

#Preview {
    PlanReviews(planID: "samplePlan")
        .environmentObject(ReviewManager())
}

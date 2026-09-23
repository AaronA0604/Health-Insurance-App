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
        VStack(spacing: 12) {
            ForEach(reviewManager.filteredReviews, id: \.id) { review in
                VStack(alignment: .leading) {
                    Text("Network Coverage:")
                        .bold()
                    HStack {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= review.netCov ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .font(.system(size: 32))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(height: 50)
                    Text(review.netCovText)
                    Divider()
                    
                    Text("Communication:")
                        .bold()
                    HStack {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= review.com ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .font(.system(size: 32))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(height: 50)
                    Text(review.comText)
                    Divider()
                    
                    Text("Customer Service:")
                        .bold()
                    HStack {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= review.service ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .font(.system(size: 32))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(height: 50)
                    Text(review.serviceText)
                    
                    Text(review.date, style: .date)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding()
                .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 16))
            }
            
            // TODO: maybe add a show more button
        }
        .onAppear {
            reviewManager.selectedPlanID = planID
            
        }
    }
}

#Preview {
    Background {
        PlanReviews(planID: "001")
            .environmentObject(ReviewManager())
    }
}

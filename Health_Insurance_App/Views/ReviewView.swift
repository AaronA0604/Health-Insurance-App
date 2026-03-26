//
//  ReviewView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/17/26.
//

import SwiftUI

struct ReviewView: View {
    let planID: String
    @State private var netCov = 0
    @State private var netCovText = ""
    @State private var com = 0
    @State private var comText = ""
    @State private var service = 0
    @State private var serviceText = ""
    
    @State private var rating = 0
    
    var formIsComplete: Bool {
        netCov > 0 &&
        com > 0 &&
        service > 0
    }
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var reviewManager: ReviewManager
    
    var body: some View {
        Background {
            ScrollView {
                VStack {
                    // Network coverage
                    ReviewInputCard(catName: "Network Coverage") {
                        
                        StarRating(rating: $netCov)
                        
                        TextField("Why did you give this rating (optional)", text: $netCovText)
                            .multilineTextAlignment(.leading)
                            .accessibilityLabel("Rating Explanation")
                            .padding()
                            .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 16))
                    }
                    
                    // Communication
                    ReviewInputCard(catName: "Communication") {
                        
                        StarRating(rating: $com)
                        
                        TextField("Why did you give this rating (optional)", text: $comText)
                            .multilineTextAlignment(.leading)
                            .accessibilityLabel("Rating Explanation")
                            .padding()
                            .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 16))
                    }
                    
                    // Costumer service
                    ReviewInputCard(catName: "Costumer Service") {
                        
                        StarRating(rating: $service)
                        
                        TextField("Why did you give this rating (optional)", text: $serviceText)
                            .multilineTextAlignment(.leading)
                            .accessibilityLabel("Rating Explanation")
                            .padding()
                            .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 16))
                    }
                }
            }
            .padding(.horizontal)
            .toolbar {
                // Done button
                ToolbarItemGroup(placement: .bottomBar) {
                    // Cancel button
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Button("Done") {
                        reviewManager.addReview(
                            planID: planID,
                            netCov: netCov,
                            netCovText: netCovText,
                            com: com,
                            comText: comText,
                            service: service,
                            serviceText: serviceText
                        )
                        
                        dismiss()
                    }
                    .disabled(!formIsComplete)
                }
            }
        }
        .navigationTitle("Leave a Review")
    }
}

#Preview {
    @Previewable @State var review = Review.empty
    NavigationStack {
        ReviewView(planID: "TEMP")
    }
}

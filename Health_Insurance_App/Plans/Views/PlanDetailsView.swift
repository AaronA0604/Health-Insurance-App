//
//  PlanDetailsView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/12/26.
//

import SwiftUI

struct PlanDetailsView: View {
    @StateObject var vm = PlansViewModel()
    @State private var showReview = false
    @StateObject var reviewManager = ReviewManager()
    var selection: Int
    
    var body: some View {
        Background {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    VStack {
                        // MARK: Deductible and premium information
                        CostDetailsCard(plan: vm.recommendedPlans[selection])
                        
                        HStack {
                            // MARK: Link to provider's home page
                            Link(destination: URL(string: vm.recommendedPlans[selection].url)!) {
                                Text("\(vm.recommendedPlans[selection].coName)'s home page")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(.tint, in: RoundedRectangle(cornerRadius: 16))
                                    .foregroundStyle(.white)
                            }
                            
                            // MARK: Navigation link to specific details page
                            NavigationLink {
                                SpecificDetailsView()
                            } label: {
                                Text("Further details")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding()
                                    .background(.tint, in: RoundedRectangle(cornerRadius: 16))
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .padding()
                    .background(.white, in: RoundedRectangle(cornerRadius: 16))
                    
                    // MARK: Why plan is recommended
                    VStack(alignment: .leading) {
                        Text("Why this plan is recommended for you")
                            .font(.title3)
                            .bold()
                        RecommendationTextCard()
                    }
                    .padding()
                    .background(.white, in: RoundedRectangle(cornerRadius: 16))
                    
                    // MARK: Reviews
                    VStack(alignment: .leading) {
                        Text("User Reviews")
                            .font(.title3)
                            .bold()
                        
                        Button("Leave a review") {
                            showReview = true
                        }
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.tint, in: RoundedRectangle(cornerRadius: 16))
                        .foregroundStyle(.white)
                        .sheet(isPresented: $showReview) {
                            NavigationStack {
                                ReviewView(planID: vm.recommendedPlans[selection].id)
                                    .environmentObject(reviewManager)
                            }
                        }
                        
                        PlanReviews(planID: vm.recommendedPlans[selection].id)
                            .environmentObject(reviewManager)
                    }
                    .padding()
                    .background(.white, in: RoundedRectangle(cornerRadius: 16))
                }
                .padding(.horizontal)
            }
            .navigationTitle(vm.recommendedPlans[selection].planName)
        }
    }
}

#Preview {
    NavigationStack {
        PlanDetailsView(selection: 0)
            .environmentObject({
                let manager = ReviewManager()
                manager.selectedPlanID = "001"
                return manager
            }())
    }
}

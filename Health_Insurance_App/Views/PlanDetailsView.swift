//
//  PlanDetailsView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/12/26.
//

import SwiftUI

struct PlanDetailsView: View {
    @StateObject var vm = RecommendationViewModel()
    @State private var showReview = false
    @StateObject var reviewManager = ReviewManager()
    var selection: Int
    
    var body: some View {
        Background {
            ScrollView {
                VStack(alignment: .leading) {
                    CostDetailsCard(plan: vm.plans[selection])
                    
                    Link(destination: URL(string: vm.plans[selection].url)!) {
                        Text("\(vm.plans[selection].coName)'s home page")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.tint, in: RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(.white)
                    }
                    Text("Why this plan is recommended for you")
                        .font(.title3)
                        .bold()
                    RecommendationTextCard()
                    
                    Text("User Reviews")
                        .font(.title3)
                        .bold()
                    
                    Button("Leave Review") {
                        showReview = true
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.tint, in: RoundedRectangle(cornerRadius: 12))
                    .foregroundStyle(.white)
                    .sheet(isPresented: $showReview) {
                        NavigationStack {
                            ReviewView(planID: vm.plans[selection].id)
                                .environmentObject(reviewManager)
                        }
                    }
                    
                    PlanReviews()
                }
                .padding(.horizontal)
            }
            .navigationTitle(vm.plans[selection].planName)
        }
    }
}

#Preview {
    NavigationStack {
        PlanDetailsView(selection: 0)
    }
}

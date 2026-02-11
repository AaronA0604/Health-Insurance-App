//
//  RecommendationView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/13/26.
//

import SwiftUI

struct RecommendationView: View {
    @StateObject var vm = RecommendationViewModel()
    @State private var showPopup = false
    
    var body: some View {
        Background {
            ScrollView {
                ZStack {
                    VStack {
                        ForEach(Array(vm.cardModels.enumerated()), id: \.element.id) { index, recommendation in
                            let border: Color =
                            index < 2 ? .purple :
                            index == 2 ? .blue :
                                .green
                            
                            RecommendationCard(recommendation: recommendation, border: border)
                        }
                        // TODO: add links to the plan details pages for each card
                        
                        NavigationLink {
                            PredictionsView()
                        } label: {
                            Text("Personalized Predictions")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.tint, in: RoundedRectangle(cornerRadius: 12))
                                .foregroundStyle(.white)
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                withAnimation(.spring(response: 0.25, dampingFraction: 0.85)) {
                                    showPopup.toggle()
                                }
                            }) {
                                Image(systemName: "info.circle")
                            }
                        }
                    }
                    
                    // Popup overlay
                    if showPopup {
                        ZStack {
                            Color.black.opacity(0.001)
                                .ignoresSafeArea()
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.25, dampingFraction: 0.85)) {
                                        showPopup = false
                                    }
                                }
                            
                            // Position the popup in the top-right corner
                            VStack {
                                HStack {
                                    Spacer()
                                    InfoPopup()
                                    // TODO: add animation like in messages and add animations other places where needed
                                        .padding(.top, 10)
                                        .padding(.trailing, 10)
                                }
                                Spacer()
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Recommendations")
        }
    }
}

#Preview {
    NavigationStack {
        RecommendationView()
    }
}

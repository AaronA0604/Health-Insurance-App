//
//  RecommendationView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/13/26.
//

import SwiftUI

// TODO: add MARK comments
struct RecommendationView: View {
    @StateObject var vm = PlansViewModel()
    @State private var showPopup = false
    @State private var selection: Int = 0

    var body: some View {
        Background {
            ScrollView {
                ZStack {
                    VStack {
                        ForEach(Array(vm.recommendationCardModels.enumerated()), id: \.element.id) { index, recommendation in
                            NavigationLink {
                                PlanDetailsView(selection: index, recommended: true)
                            } label: {
                                RecommendationCard(recommendation: recommendation, border: borderColor(for: index))
                            }
                                .tint(.primary)
                            }
                        
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
                    
                    if showPopup {
                        // TODO: make the color.clear expand to the edges of the screen
                        ZStack {
                            Color.clear
                                .contentShape(Rectangle())
                                .ignoresSafeArea()
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        showPopup = false
                                    }
                                }
                            
                            VStack {
                                HStack {
                                    Spacer()
                                    InfoPopup()
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
    
    private func borderColor(for index: Int) -> Color {
        if index < 2 { return .purple }
        if index == 2 { return .blue }
        return .green
    }
}

#Preview {
    NavigationStack {
        RecommendationView()
    }
}

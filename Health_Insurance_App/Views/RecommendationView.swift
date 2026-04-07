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
    @State private var selection: Int = 0

    private var cardList: some View {
        ForEach(Array(vm.cardModels.enumerated()), id: \.element.id) { index, recommendation in
            let border: Color = {
                if index < 2 { return .purple }
                if index == 2 { return .blue }
                return .green
            }()
            
            
            NavigationLink {
                PlanDetailsView(selection: index)
            } label: {
                RecommendationCard(recommendation: recommendation, border: border)
            }
            .tint(.primary)
        }
    }

    private var popupOverlay: some View {
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

    var body: some View {
        Background {
            ScrollView {
                ZStack {
                    VStack {
                        cardList

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
                        popupOverlay
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

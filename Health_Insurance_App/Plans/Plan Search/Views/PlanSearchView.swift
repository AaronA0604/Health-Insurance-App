//
// PlanSearchView.swift
// Health_Insurance_App
//
// Created by Aaron Aslan on 4/19/26.
//

import SwiftUI
// TODO: think of a different name besides Plan Search
// TODO: animate from question to question
struct PlanSearchView: View {
    @StateObject var plansVM = PlansViewModel()
    @StateObject var questionsVM = QuestionsViewModel()
    var engine = PlanFilteringEngine()
    
    @State private var selection: Int = 0
    @State var questions: Questions
    
    @State private var showSheet = true
    @State private var showPopup = false
    
    var body: some View {
        Background {
            ScrollView {
                ZStack {
                    VStack {
                        Button {
                            showSheet = true
                            questionsVM.questionIndex = 0
                        } label: {
                            HStack {
                                Text("Retake Questionnaire")
                                    .padding()
                                    .foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.tint)
                            )
                        }
                        .buttonStyle(.plain)
                        
                        ForEach(Array(plansVM.planCardModels.enumerated()), id: \.element.id) { index, plan in
                            NavigationLink() {
                                PlanDetailsView(selection: index, recommended: false)
                            } label: {
                                PlanCard(plan: plan)
                            }
                            .tint(.primary)
                        }
                    }
                    .padding(.horizontal)
                    .sheet(isPresented: $showSheet, onDismiss: {
                        plansVM.refresh(scores: engine.updateScores(selectedAnswers: questionsVM.selectedAnswers))
                    }) {
                        QuestionnaireSheetView(vm: questionsVM)
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                withAnimation(.spring(response: 0.25, dampingFraction: 0.85)) {
                                    showPopup.toggle()
                                }
                            } label: {
                                Image(systemName: "slider.horizontal.3")
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
                                    SortPlansPopup(vm: plansVM) {
                                        showPopup = false
                                    }
                                    .padding(.top, 10)
                                    .padding(.trailing, 10)
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Plan Search")
        }
    }
}

#Preview {
    NavigationStack {
        PlanSearchView(questions: Questions())
    }
}

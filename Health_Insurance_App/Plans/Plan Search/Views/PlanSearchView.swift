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
    @StateObject var vm = PlansViewModel()
    @State private var selection: Int = 0
    @State var questions: Questions
    @State private var showSheet = true
    var engine = PlanFilteringEngine()
    
    var body: some View {
        Background {
            ScrollView {
                VStack {
                    ForEach(Array(vm.planCardModels.enumerated()), id: \.element.id) { index, plan in
                        NavigationLink() {
                            PlanDetailsView(selection: index)
                        } label: {
                            PlanCard(plan: plan)
                        }
                        .tint(.primary)
                    }
                }
                .padding(.horizontal)
                .sheet(isPresented: $showSheet, onDismiss: {
                    engine.updateQualifyingVars()
                }) {
                    QuestionnaireSheetView()
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

//
// PlanSearch.swift
// Health_Insurance_App
//
// Created by Aaron Aslan on 4/19/26.
//

import SwiftUI
// TODO: think of a different name besides Plan Search

struct PlanSearch: View {
    @StateObject var vm = QuestionsViewModel()
    @State private var selection: Int = 0
    @State var questions: Questions
    
    var body: some View {
        Background {
            ScrollView {
                VStack {
                    QuestionCard(
                        question: vm.currentQuestion.question,
                        answers: vm.currentQuestion.answers
                    ) { answer in
                        vm.answerSelected(answer)
                    }
                }
                .padding(.horizontal)
            } .navigationTitle("Plan Search")
        }
    }
}

#Preview {
    NavigationStack {
        PlanSearch(questions: Questions())
    }
}

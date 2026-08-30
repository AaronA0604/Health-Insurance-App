//
//  QuestionnaireSheetView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 8/24/26.
//

import SwiftUI

struct QuestionnaireSheetView: View {
    @StateObject var vm = QuestionsViewModel()
    @State private var showQuestionnaire = false
    @Environment(\.dismiss) private var dismiss
    let questions = Questions().questions
    
    var body: some View {
        NavigationStack {
            if !showQuestionnaire {
                VStack {
                    Image(systemName: "questionmark.circle")
                        .foregroundStyle(.tint)
                        .font(.system(size: 100))
                        .padding()
                    Text("Before we can show you the health insurance plans that work best for you, answer these questions so we can get started. The questions will help us determine what types of plans fit you.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding()
                    Button {
                        showQuestionnaire = true
                    } label: {
                        HStack {
                            Text("Continue")
                                .padding()
                                .foregroundStyle(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.tint)
                        )
                    }
                    .padding(.horizontal, 16)
                }
                .toolbar {
                    // dismiss button
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
            } else {
                VStack {
                    if let question = vm.currentQuestion {
                        QuestionCard(
                            question: question.question,
                            answers: question.answers
                        ) { answer in
                            vm.answerSelected(answer)
                            
                            if vm.dismissQuestionnaire == true {
                                dismiss()
                            }
                        }
                    } else {                                            ProgressView()
                    }
                    Spacer()
                }
                .toolbar {
                    // back button
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            if vm.questionIndex == 0 {
                                showQuestionnaire = false
                                
                            } else {
                                vm.questionIndex -= 1
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                    }
                    
                    // finish button
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    QuestionnaireSheetView()
}

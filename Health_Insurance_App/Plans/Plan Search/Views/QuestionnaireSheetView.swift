//
//  QuestionnaireSheetView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 8/24/26.
//

import SwiftUI

struct QuestionnaireSheetView: View {
    @ObservedObject var vm: QuestionsViewModel
    
    @State private var showQuestionnaire = false
    let questions = Questions().questions
    
    @State private var questionTransition: AnyTransition = .move(edge: .trailing)
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                if !showQuestionnaire {
                    // MARK: Intro
                    VStack {
                        Image(systemName: "questionmark.circle")
                            .foregroundStyle(.tint)
                            .font(.system(size: 100))
                            .padding()
                        
                        Text("Before we can show you the health insurance plans that work best for you, answer these questions so we can get started. The questions will help us determine what types of plans fit you.")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        // continue button
                        Button {
                            // Moving forward into questionnaire
                            questionTransition = .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)
                            )
                            
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showQuestionnaire = true
                            }
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
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .leading),
                            removal: .move(edge: .leading)
                        )
                    )
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
                    // MARK: Questions
                    VStack {
                        if let question = vm.currentQuestion {
                            QuestionCard(
                                question: question.question,
                                answers: question.answers
                            ) { answer in
                                // forward transition
                                questionTransition = .asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)
                                )
                                
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    vm.answerSelected(answer)
                                }
                                
                                if vm.dismissQuestionnaire == true {
                                    dismiss()
                                }
                            }
                            .id(vm.questionIndex)
                            .transition(questionTransition)
                        } else {
                            ProgressView()
                        }
                        Spacer()
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                if vm.questionIndex == 0 {
                                    // Return to introduction
                                    questionTransition = .asymmetric(
                                        insertion: .move(edge: .leading),
                                        removal: .move(edge: .trailing)
                                    )
                                    
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        showQuestionnaire = false
                                    }
                                    
                                } else {
                                    // Move backward to previous question
                                    questionTransition = .asymmetric(
                                        insertion: .move(edge: .leading),
                                        removal: .move(edge: .trailing)
                                    )
                                    
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        vm.questionIndex -= 1
                                    }
                                }
                            } label: {
                                Image(systemName: "chevron.left")
                            }
                        }
                        
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
}

#Preview {
    QuestionnaireSheetView(vm: QuestionsViewModel())
}

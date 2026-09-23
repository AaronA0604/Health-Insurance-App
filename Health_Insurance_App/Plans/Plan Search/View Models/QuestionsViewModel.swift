//
//  QuestionsViewModel.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 8/21/26.
//

import Foundation
import SwiftUI
internal import Combine

@MainActor
class QuestionsViewModel: ObservableObject {
    @Published var selectedAnswers: [Int: Answer] = [:]
    
    let questions = Questions().questions
    @Published var questionIndex = 0
    @Published var dismissQuestionnaire = false

    var currentQuestion: QuestionVars? {
        guard questions.indices.contains(questionIndex) else { return nil }
        return questions[questionIndex]
    }
    
    private let engine = PlanFilteringEngine()
            
    func answerSelected(_ answer: Answer) {
        // keep track of answers
        selectedAnswers[questionIndex] = answer
                
        // go to next question
        questionIndex += 1
        
        // dismiss questionnaire when questions are finished
        if questionIndex >= questions.count {
            dismissQuestionnaire = true
        }
    }
}

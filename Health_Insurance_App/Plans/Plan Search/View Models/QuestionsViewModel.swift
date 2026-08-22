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
    let questions = Questions().questions
    @Published var questionIndex = 0
    var currentQuestion: QuestionVars {
        questions[questionIndex]
    }
    
    func answerSelected(_ answer: String) {
        // go to next question
        questionIndex += 1
    }
}

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
    var currentQuestion: QuestionVars? {
        guard questions.indices.contains(questionIndex) else { return nil }
        return questions[questionIndex]
    }
    var scores = ScoreDictionary()
    @Published var dismissQuestionnaire = false
    
    func answerSelected(_ answer: Answer) {
        // append scores
        for (networkType, points) in answer.scoreChanges.networkType {
            scores.networkType[networkType, default: 0] += points
        }
        
        for (riskProfile, points) in answer.scoreChanges.riskProfile {
            scores.riskProfile[riskProfile, default: 0] += points
        }
        
        for (drugCoverage, points) in answer.scoreChanges.drugCoverage {
            scores.drugCoverage[drugCoverage, default: 0] += points
        }
        
        for (utilizationFit, points) in answer.scoreChanges.utilizationFit {
            scores.utilizationFit[utilizationFit, default: 0] += points
        }
        
        for (coverageScope, points) in answer.scoreChanges.coverageScope {
            scores.coverageScope[coverageScope, default: 0] += points
        }
        
        // go to next question
        questionIndex += 1
        
        // dismiss questionnaire when questions are finished
        if questionIndex >= questions.count {
            dismissQuestionnaire = true
        }
    }
}

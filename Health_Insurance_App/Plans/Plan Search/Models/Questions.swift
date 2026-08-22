//
// Questions.swift
// Health_Insurance_App
//
// Created by Aaron Aslan on 7/22/26.
//

import Foundation

struct QuestionVars {
    let question: String
    let answers: [String]
}

struct Questions {
    // TODO: have other people read over each question and answer to make sure it is simple and clear
    static let questions: [QuestionVars] = [
        // network type
        QuestionVars(
            question: "Are you okay with only seeing doctors that are in your insurance network?",
            answers: ["No, that's not okay", "Maybe", "Yes, that's fine"]
        ),
        
        QuestionVars(
            question: "Are you okay with getting a referral from your primary care doctor before seeing a specialist?",
            answers: ["No, that's not okay", "Maybe", "Yes, that's fine"]
        ),
        
        QuestionVars(
            question: "How important is it that you keep your current doctors?",
            answers: ["Very important", "Somewhat important", "Not important"]
        ),
        
        QuestionVars(
            question: "Would you pay a higher monthly premium for the freedom to choose from more doctors and hospitals?",
            answers: ["Yes, I would pay more", "Maybe", "No, I wouldn't pay more"]
        ),
        
        // risk
        QuestionVars(
            question: "Would you rather pay more and have less risk of large payments, or pay less and have more risk of large payments?",
            answers: ["Pay more; less risk", "Balanced", "Pay less; more risk"]
        ),
        
        // drug coverage
        QuestionVars(
            question: "How many prescription medications do you take?",
            answers: ["I rarely take medicine", "I take one prescription", "I take a few prescriptions", "I take many prescriptions"]
        ),
        
        // utilization
        QuestionVars(
            question: "How often do you usually visit doctors or other healthcare providers in a typical year?",
            answers: ["Rarely (1-2 visits)", "Occasionally (3-5 visits)", "Often (6-10 visits)", "Very often (10+ visits or ongoing treatment)"]
        ),
        
        // coverage scope
        QuestionVars(
            question: "Where do you need to have access to healthcare?",
            answers: ["Near my home", "Throughout my region/state", "Throughout the U.S."]
        )
    ]
}

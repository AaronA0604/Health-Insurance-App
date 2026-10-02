//
// Questions.swift
// Health_Insurance_App
//
// Created by Aaron Aslan on 7/22/26.
//

import Foundation

struct Answer {
    let text: String
    let scoreChanges: ScoreDictionary
}

struct QuestionVars {
    let question: String
    let answers: [Answer]
}

struct Questions {
    // TODO: have other people read over each question and answer to make sure it is simple and clear
    // TODO: add/subtract questions and adjust scores so that questions truly reflect user preferences, and adjust threshhold for filtering accordingly - SCORES ARE NOT FINAL
    let questions: [QuestionVars] = [
        // MARK: network type
        QuestionVars(
            question: "Which of the following statements is the most true about you?",
            answers: [
                Answer(
                    text: "I want to pay the least amount of money possible, even though it limits my choice concerning healthcare.",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: 5, .ppo: -10, .epo: -10, .pos: -10, .indemnity: -10],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:]
                    )
                ),
                
                Answer(
                    text: "I want to pay a moderate amount of money to be able to have a medium amount of choice concerning my healthcare.",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: -10, .ppo: -10, .epo: 5, .pos: 5, .indemnity: -10],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:]
                    )
                ),
                
                Answer(
                    text: "I am fine with paying a lot of money, since it means I will have a lot of choice concerning my healthcare.",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: -10, .ppo: 5, .epo: -10, .pos: -10, .indemnity: -10],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:]
                    )
                ),
                
                Answer(
                    text: "I am fine with paying the most amount of money, since it means I will have full choice concerning my healthcare.",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: -10, .ppo: -10, .epo: -10, .pos: -10, .indemnity: 5],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:]
                    )
                )
            ]
        ),
        
        
        
//        QuestionVars(
//            question: "Which of the following statements is true about you? (You may select multiple answers.)",
//            answers: [
//                Answer(
//                    text: "I am fine with my insurance only covering doctors and hospitals that are in my network, except for emergencies.",
//                    scoreChanges: ScoreDictionary(
//                        networkType: [.hmo: 5, .epo: 5],
//                        riskProfile: [:],
//                        drugCoverage: [:],
//                        utilizationFit: [:]
//                    )
//                ),
//                
//                Answer(
//                    text: "I want to be able to use any doctor or hospital, but I will pay more if they are out of my insurance network.",
//                    scoreChanges: ScoreDictionary(
//                        networkType: [.hmo: -10, .ppo: 5, .epo: -10, .ppo: 5],
//                        riskProfile: [:],
//                        drugCoverage: [:],
//                        utilizationFit: [:]
//                    )
//                ),
//                
//                Answer(
//                    text: "I want full freedom to use any doctor or hospital without a change in the cost.",
//                    scoreChanges: ScoreDictionary(
//                        networkType: [.hmo: -10, .ppo: -10, .epo: -10, .pos: -10, .indemnity: 5],
//                        riskProfile: [:],
//                        drugCoverage: [:],
//                        utilizationFit: [:]
//                    )
//                )
//            ]
//        ),
//        
//        QuestionVars(
//            question: "Which of the following statements is true about you? (You may select multiple answers.)",
//            answers: [
//                Answer(
//                    text: "I am fine with needing to have a primary care physician, and to need a referral to see any specialist.",
//                    scoreChanges: ScoreDictionary(
//                        networkType: [.ppo: 5, .epo: 5, .pos: 2, .indemnity: 5, .pffs: 5],
//                        riskProfile: [:],
//                        drugCoverage: [:],
//                        utilizationFit: [:]
//                    )
//                ),
//                
//                Answer(
//                    text: "I want to not be required to have a primary care physician, and to not have to have a referral to see a specialist.",
//                    scoreChanges: ScoreDictionary(
//                        networkType: [.hmo: 2, .ppo: 5, .epo: 5, .pos: 3, .indemnity: 5, .pffs: 5],
//                        riskProfile: [:],
//                        drugCoverage: [:],
//                        utilizationFit: [:]
//                    )
//                )
//            ]
//        ),
        
        // MARK: risk
        QuestionVars(
            question: "Would you rather pay more upfront and have less risk of large payments, or pay less upfront and have more risk of large payments?",
            answers: [
                Answer(
                    text: "Pay more; less risk",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [.hplr: 5],
                        drugCoverage: [:],
                        utilizationFit: [:]
                    )
                ),
                
                Answer(
                    text: "Balanced",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [.balanced: 5],
                        drugCoverage: [:],
                        utilizationFit: [:]
                    )
                ),
                
                Answer(
                    text: "Pay less; more risk",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [.lphr: 5],
                        drugCoverage: [:],
                        utilizationFit: [:]
                    )
                )
            ]
        ),
        
        // MARK: drug coverage
        QuestionVars(
            question: "How many prescription medications do you take?",
            answers: [
                Answer(
                    text: "I rarely take medicine",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [.poor: 5],
                        utilizationFit: [:]
                    )
                ),
                
                Answer(
                    text: "I take one prescription",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [.standard: 5],
                        utilizationFit: [:]
                    )
                ),
                
                Answer(
                    text: "I take a few prescriptions",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [.strong: 5],
                        utilizationFit: [:]
                    )
                ),
                
                Answer(
                    text: "I take many prescriptions",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [.veryStrong: 5],
                        utilizationFit: [:]
                    )
                )
            ]
        ),
        
        // MARK: utilization
        QuestionVars(
            question: "How often do you usually visit doctors or other healthcare providers in a typical year?",
            answers: [
                Answer(
                    text: "Rarely (1-2 visits)",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [.low: 5]
                    )
                ),
                
                Answer(
                    text: "Occasionally (3-5 visits)",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [.medium: 5]
                    )
                ),
                
                Answer(
                    text: "Often (6-10 visits)",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [.high: 5]
                    )
                ),
                
                Answer(
                    text: "Very often (10+ visits or ongoing treatment)",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [.veryHigh: 5]
                    )
                )
            ]
        )
    ]
}

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
            question: "Are you okay with only seeing doctors that are in your insurance network?",
            answers: [
                Answer(
                    text: "No, that's not okay",
                    scoreChanges: ScoreDictionary(
                        networkType: [.ppo: 5, .pos: 2, .indemity: 5, .pffs: 3],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Maybe",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: 2, .ppo: 5, .epo: 2, .pos: 3, .indemity: 5, .pffs: 3],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Yes, that's fine",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: 5, .ppo: 5, .epo: 5, .pos: 5, .indemity: 5, .pffs: 5],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                )
            ]
        ),
        
        QuestionVars(
            question: "Are you okay with getting a referral from your primary care doctor before seeing a specialist?",
            answers: [
                Answer(
                    text: "No, that's not okay",
                    scoreChanges: ScoreDictionary(
                        networkType: [.ppo: 5, .epo: 5, .pos: 2, .indemity: 5, .pffs: 5],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Maybe",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: 2, .ppo: 5, .epo: 5, .pos: 3, .indemity: 5, .pffs: 5],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Yes, that's fine",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: 5, .ppo: 5, .epo: 5, .pos: 5, .indemity: 5, .pffs: 5],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                )
            ]
        ),
        
        QuestionVars(
            question: "How important is it that you keep your current doctors?",
            answers: [
                Answer(
                    text: "Very important",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: 1, .ppo: 5, .epo: 2, .pos: 4, .indemity: 5, .pffs: 4],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Somewhat important",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: 3, .ppo: 5, .epo: 3, .pos: 5, .indemity: 5, .pffs: 5],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Not important",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: 5, .ppo: 5, .epo: 5, .pos: 5, .indemity: 5, .pffs: 5],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                )
            ]
        ),
        
        QuestionVars(
            question: "Would you pay a higher monthly premium for the freedom to choose from more doctors and hospitals?",
            answers: [
                Answer(
                    text: "Yes, I would pay more",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: 1, .ppo: 5, .epo: 2, .pos: 4, .indemity: 5, .pffs: 4],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Maybe",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: 3, .ppo: 3, .epo: 3, .pos: 3, .indemity: 3, .pffs: 3],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "No, I wouldn't pay more",
                    scoreChanges: ScoreDictionary(
                        networkType: [.hmo: 5, .ppo: 2, .epo: 5, .pos: 2, .indemity: 2, .pffs: 2],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                )
            ]
        ),
        
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
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Balanced",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [.balanced: 5],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Pay less; more risk",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [.lphr: 5],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [:]
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
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "I take one prescription",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [.standard: 5],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "I take a few prescriptions",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [.strong: 5],
                        utilizationFit: [:],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "I take many prescriptions",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [.veryStrong: 5],
                        utilizationFit: [:],
                        coverageScope: [:]
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
                        utilizationFit: [.low: 5],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Occasionally (3-5 visits)",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [.medium: 5],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Often (6-10 visits)",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [.high: 5],
                        coverageScope: [:]
                    )
                ),
                
                Answer(
                    text: "Very often (10+ visits or ongoing treatment)",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [.veryHigh: 5],
                        coverageScope: [:]
                    )
                )
            ]
        ),
        
        // MARK: coverage scope
        QuestionVars(
            question: "Where do you need to have access to healthcare?",
            answers: [
                Answer(
                    text: "Near my home",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [.local: 5, .regional: 5, .national: 5]
                    )
                ),
                
                Answer(
                    text: "Throughout my region/state",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [.regional: 5, .national: 5]
                    )
                ),
                
                Answer(
                    text: "Throughout the U.S.",
                    scoreChanges: ScoreDictionary(
                        networkType: [:],
                        riskProfile: [:],
                        drugCoverage: [:],
                        utilizationFit: [:],
                        coverageScope: [.national: 5]
                    )
                )
            ]
        )
    ]
}

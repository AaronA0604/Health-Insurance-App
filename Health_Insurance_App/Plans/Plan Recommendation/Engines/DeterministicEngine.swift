//
//  DeterministicEngine.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/28/26.
//

import Foundation

struct DeterministicEngine {
    // TODO: make deterministic engine
    
    static let sample: [RecommendationPlanVars] = [
        RecommendationPlanVars(
            // TODO: delete id here and in RecommendationPlanVars() after id becomes a UUID() that persists to a database
            id: "001",
            planName: "Sample Plan",
            coName: "Blue Cross",
            deductible: 3000.00,
            premium: 400.00,
            isRecommended: false,
            url: "https://www.bcbs.com/"
        ),
        
        RecommendationPlanVars(
            id: "002",
            planName: "Sample Plan",
            coName: "Highmark",
            deductible: 3200.00,
            premium: 375.00,
            isRecommended: false,
            url: "https://highmark.com/"
        ),
        
        RecommendationPlanVars(
            id: "003",
            planName: "Sample Plan",
            coName: "Aetna",
            deductible: 3500.00,
            premium: 315.00,
            isRecommended: true,
            url: "https://www.aetna.com/"
        ),
        
        RecommendationPlanVars(
            id: "004",
            planName: "Sample Plan",
            coName: "Humana",
            deductible: 3800.00,
            premium: 250.00,
            isRecommended: false,
            url: "https://www.humana.com/"
        ),
        
        RecommendationPlanVars(
            id: "005",
            planName: "Sample Plan",
            coName: "Aetna",
            deductible: 4000.00,
            premium: 215.00,
            isRecommended: false,
            url: "https://www.aetna.com/"
        )
    ]
}

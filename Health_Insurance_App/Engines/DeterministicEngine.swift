//
//  DeterministicEngine.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/28/26.
//

import Foundation

struct DeterministicEngine {
    // TODO: make deterministic engine
    
    static let sample: [PlanVars] = [
        PlanVars(
            planName: "Sample Plan",
            coName: "Blue Cross",
            deductible: 3000.00,
            premium: 400.00,
            isRecommended: false,
        ),
        
        PlanVars(
            planName: "Sample Plan",
            coName: "Highmark",
            deductible: 3200.00,
            premium: 375.00,
            isRecommended: false,
        ),
        
        PlanVars(
            planName: "Sample Plan",
            coName: "Aetna",
            deductible: 3500.00,
            premium: 315.00,
            isRecommended: true,
        ),
        
        PlanVars(
            planName: "Sample Plan",
            coName: "Humana",
            deductible: 3800.00,
            premium: 250.00,
            isRecommended: false,
        ),
        
        PlanVars(
            planName: "Sample Plan",
            coName: "Aetna",
            deductible: 4000.00,
            premium: 215.00,
            isRecommended: false,
        )
    ]
}

//
//  SamplePlans.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 4/16/26.
//

import Foundation

// TODO: delete this file once you have a dataset with plans

struct SamplePlans {
    static let plans: [PlanVars] = [
        // TODO: delete id here after id becomes a UUID() that persists to a database
        PlanVars(
            id: "001",
            planName: "Sample Plan",
            coName: "Blue Cross",
            deductible: 3000.00,
            premium: 400.00,
            url: "https://www.bcbs.com/",
            oopMax: 7000.00,
            networkType: .ppo,
            riskProfile: .hplr,
            drugCoverage: .standard,
            utilizationFit: .high,
            coverageScope: .national,
        ),
        
        PlanVars(
            id: "002",
            planName: "Sample Plan",
            coName: "Highmark",
            deductible: 3200.00,
            premium: 375.00,
            url: "https://highmark.com/",
            oopMax: 7700.00,
            networkType: .hmo,
            riskProfile: .balanced,
            drugCoverage: .poor,
            utilizationFit: .low,
            coverageScope: .national,
        ),
        
        PlanVars(
            id: "003",
            planName: "Sample Plan",
            coName: "Aetna",
            deductible: 3500.00,
            premium: 315.00,
            url: "https://www.aetna.com/",
            oopMax: 7200.00,
            networkType: .hmo,
            riskProfile: .balanced,
            drugCoverage: .standard,
            utilizationFit: .medium,
            coverageScope: .regional,
        ),
        
        PlanVars(
            id: "004",
            planName: "Sample Plan",
            coName: "Humana",
            deductible: 3800.00,
            premium: 250.00,
            url: "https://www.humana.com/",
            oopMax: 8000.00,
            networkType: .pos,
            riskProfile: .lphr,
            drugCoverage: .strong,
            utilizationFit: .veryHigh,
            coverageScope: .national,
        ),
        
        PlanVars(
            id: "005",
            planName: "Sample Plan",
            coName: "Aetna",
            deductible: 4000.00,
            premium: 215.00,
            url: "https://www.aetna.com/",
            oopMax: 8250.00,
            networkType: .indemity,
            riskProfile: .lphr,
            drugCoverage: .poor,
            utilizationFit: .medium,
            coverageScope: .regional,
        ),
        
        PlanVars(
            id: "006",
            planName: "Sample Plan",
            coName: "Humana",
            deductible: 3200.00,
            premium: 400.00,
            url: "https://www.humana.com/",
            oopMax: 7000.00,
            networkType: .ppo,
            riskProfile: .hplr,
            drugCoverage: .standard,
            utilizationFit: .low,
            coverageScope: .local,
        ),
        
        PlanVars(
            id: "007",
            planName: "Sample Plan",
            coName: "Blue Cross",
            deductible: 3800.00,
            premium: 210.00,
            url: "https://www.bcbs.com/",
            oopMax: 7500.00,
            networkType: .hmo,
            riskProfile: .lphr,
            drugCoverage: .veryStrong,
            utilizationFit: .low,
            coverageScope: .national,
        ),
        
        PlanVars(
            id: "008",
            planName: "Sample Plan",
            coName: "Aetna",
            deductible: 4100.00,
            premium: 190.00,
            url: "https://www.aetna.com/",
            oopMax: 8000.00,
            networkType: .pffs,
            riskProfile: .lphr,
            drugCoverage: .strong,
            utilizationFit: .medium,
            coverageScope: .regional,
        )
    ]
}

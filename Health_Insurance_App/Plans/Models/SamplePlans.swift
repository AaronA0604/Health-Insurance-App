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
            url: "https://www.bcbs.com/"
        ),
        
        PlanVars(
            id: "002",
            planName: "Sample Plan",
            coName: "Highmark",
            deductible: 3200.00,
            premium: 375.00,
            url: "https://highmark.com/"
        ),
        
        PlanVars(
            id: "003",
            planName: "Sample Plan",
            coName: "Aetna",
            deductible: 3500.00,
            premium: 315.00,
            url: "https://www.aetna.com/"
        ),
        
        PlanVars(
            id: "004",
            planName: "Sample Plan",
            coName: "Humana",
            deductible: 3800.00,
            premium: 250.00,
            url: "https://www.humana.com/"
        ),
        
        PlanVars(
            id: "005",
            planName: "Sample Plan",
            coName: "Aetna",
            deductible: 4000.00,
            premium: 215.00,
            url: "https://www.aetna.com/"
        ),
        
        PlanVars(
            id: "006",
            planName: "Sample Plan",
            coName: "Humana",
            deductible: 3200.00,
            premium: 400.00,
            url: "https://www.humana.com/"
        ),
        
        PlanVars(
            id: "007",
            planName: "Sample Plan",
            coName: "Blue Cross",
            deductible: 3600.00,
            premium: 210.00,
            url: "https://www.bcbs.com/"
        ),
        
        PlanVars(
            id: "008",
            planName: "Sample Plan",
            coName: "Aetna",
            deductible: 4100.00,
            premium: 190.00,
            url: "https://www.aetna.com/"
        )
    ]
}

//
//  PredictedRisks.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/14/26.
//

import Foundation

struct PredictedExpendentures {
    // TODO: make prediction model like in TrailAnalyzer

    static var sample: [SpendingVars] = [
        SpendingVars(
            level: "Preventative Care",
            genPrac: 0.00,
            specialist: 0.00,
            hospital: 0.00,
            pharmacy: 35.00,
            lab: 0.00
        ),
        
        SpendingVars(
            level: "Sickness",
            genPrac: 195.00,
            specialist: 110.00,
            hospital: 0.00,
            pharmacy: 60.00,
            lab: 100.00
        ),
        
        SpendingVars(
            level: "Hospitalization/Surgery",
            genPrac: 195.00,
            specialist: 210.00,
            hospital: 2600.00,
            pharmacy: 115.00,
            lab: 325.00
        )
    ]
}

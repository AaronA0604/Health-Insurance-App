//
//  PlanCardVars.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 4/19/26.
//

import Foundation

struct PlanCardVars: Identifiable {
    var id: String
    // TODO: make id a UUID() that persists through a database
    var planName: String
    var deductible: Decimal
    var premium: Decimal
}

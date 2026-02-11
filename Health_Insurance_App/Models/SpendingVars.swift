//
//  SpendingCat.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/3/26.
//

import Foundation

struct SpendingVars: Identifiable {
    let id = UUID()
    
    var level: String
    var genPrac: Decimal
    var specialist: Decimal
    var hospital: Decimal
    var pharmacy: Decimal
    var lab: Decimal
    var total: Decimal {
        genPrac + specialist + hospital + pharmacy + lab
    }
}

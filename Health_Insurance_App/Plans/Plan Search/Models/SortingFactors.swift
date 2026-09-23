//
//  SortingFactors.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 9/20/26.
//

import Foundation

enum SortingFactors: String, Identifiable, CaseIterable {
    case premium = "Premium Low to High"
    case deductible = "Deductible Low to High"
    case provider = "Provider"
    
    var id: String {
        rawValue
    }
}

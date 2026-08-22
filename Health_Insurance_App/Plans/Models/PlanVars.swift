//
//  PlanVars.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 4/19/26.
//

import Foundation

struct PlanVars: Identifiable {
    let id: String
    // TODO: make id a UUID() that persists through a database
    
    // vars displayed on plan card
    var planName: String
    var coName: String
    var deductible: Decimal
    var premium: Decimal
    var url: String
    
    
    // vars for specific plan details
    // TODO: add all variables for specific plan details that the user would want to know. Make sure each variable is consistent throughout every single plan. These variables can be found in the Insurance Plan Types conversation with ChatGPT under aaron.aslan@jbha.org.
    var oopMax: Decimal
    
    
    // vars for computing categorical values below
    // vars for computing riskProfile
    var annualPremium: Decimal {
        premium * 12
    }
    var maxCost: Decimal {
        annualPremium + oopMax
    }
    var frontLoadRatio: Decimal{
        deductible / oopMax
    }
    var premiumRatio: Decimal {
        annualPremium / maxCost
    }
    
    // vars for computing drugCoverage
    // TODO: uncomment these variables and use them to compute their respective variables after you have the list of all the specific variables. Some of these variables may have to change.
//    var formularyCoverageRate: Decimal   // % of common drugs covered
//    var avgDrugCoinsurance: Decimal
//    var avgDrugCopay: Decimal
//    var specialtyDrugCoverage: Decimal
    
    // vars for computing utilizationFit
//    var avgCopay: Decimal
//    var avgCoinsuranceRate: Decimal
    
    // vars for computing coverageScope
//    var networkStatesCovered: Int
    
    // vars for computing coverageStrength
//    var preventiveCostSharing: Decimal
//    var mentalHealthCopay: Decimal
//    var specialistCopay: Decimal
//    var chronicCoinsurance: Decimal
    
    // vars for categories in plan selection (also displayed in specific plan details)
    // TODO: maybe add a category for the plan source - e.g. ACA, non-ACA, medicare, etc.
    var networkType: NetworkType    // type of network
    var riskProfile: RiskProfile    // overall financial exposure + cost structure
    var drugCoverage: DrugCoverage  // how good the prescription coverage is
    var utilizationFit: UtilizationFit  // what usage level the plan is optimized for
    var coverageScope: CoverageScope    // how large the coverage area is
    // TODO: add other variables as needed
}

//
//  CostDetailsCard.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/12/26.
//

import SwiftUI

struct CostDetailsCard: View {
    let plan: PlanVars
    
    var body: some View {
        VStack {
            Text("Deductible: \(plan.deductible, format: .currency(code: "USD"))")
        }
    }
}

#Preview {
    CostDetailsCard(
        plan: PlanVars(
            planName: "Preventative Care",
            coName: 0.00,
            specialist: 0.00,
            hospital: 0.00,
            pharmacy: 35.00,
            lab: 0.00
        )
        
        planName: String
        coName: String
        deductible: Decimal
        premium: Decimal
        isRecommended: Bool
    )
}

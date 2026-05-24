//
//  CostDetailsCard.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/12/26.
//

import SwiftUI

struct CostDetailsCard: View {
    let plan: RecommendationPlanVars
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Deductible: \(plan.deductible, format: .currency(code: "USD").precision(.fractionLength(0...2)))")
                    .font(.title2)
                Text("Premium: \(plan.premium, format: .currency(code: "USD").precision(.fractionLength(0...2)))")
                    .font(.title2)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    Background {
        CostDetailsCard(
            plan: RecommendationPlanVars(
                id: "003",
                planName: "Sample Plan",
                coName: "Aetna",
                deductible: 3500.00,
                premium: 315.00,
                isRecommended: true,
                url: "https://www.aetna.com/"
            )
        )
    }
}

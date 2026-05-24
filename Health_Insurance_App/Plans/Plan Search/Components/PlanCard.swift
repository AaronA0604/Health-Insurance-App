//
//  PlanCard.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 4/19/26.
//

import SwiftUI

struct PlanCard: View {
    var plan: PlanCardVars
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                Image(systemName: "pencil.and.list.clipboard")
                    .resizable()
                    .foregroundColor(Color("AccentColor"))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 70)
                    .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text(plan.planName)
                        .font(.title2.bold())
                    // TODO: put text on new line or make smaller before it overlaps with recommended text
                    Text("Deductible: \(plan.deductible, format: .currency(code: "USD").precision(.fractionLength(0...2)))")
                    Text("Premium: \(plan.premium, format: .currency(code: "USD").precision(.fractionLength(0...2)))")
                    
                }
                
                Spacer()
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
                    .stroke(.black, lineWidth: 4)

            )
        }
    }
}

#Preview {
    Background {
        PlanCard(
            plan: PlanCardVars(
                id: "002",
                planName: "Sample Plan",
                deductible: 3200,
                premium: 375
            )
        )
    }
}


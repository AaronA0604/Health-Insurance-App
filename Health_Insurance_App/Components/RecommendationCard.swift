//
//  RecommendationCard.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/15/26.
//

import SwiftUI

struct RecommendationCard: View {
    let recommendation: RecommendationCardVars
    var border: Color
    
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
                    Text(recommendation.planName)
                        .font(.title2.bold())
                    // TODO: put text on new line or make smaller before it overlaps with recommended text
                    Text("Deductible: \(recommendation.deductible, format: .currency(code: "USD").precision(.fractionLength(0...2)))")
                    Text("Premium: \(recommendation.premium, format: .currency(code: "USD").precision(.fractionLength(0...2)))")
                    
                }
                
                Spacer()
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(border, lineWidth: 4)
            )
            
            if recommendation.isRecommended {
                Text("Recommended")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(border.opacity(0.15))
                    .foregroundColor(.blue)
                    .clipShape(Capsule())
                    .padding(8)
            }
        }
    }
}

#Preview {
    Background {
        RecommendationCard(
            recommendation: RecommendationCardVars(
                planName: "Sample Plan",
                deductible: 3200,
                premium: 375,
                isRecommended: true,
            ),
            border: .blue
        )
    }
}

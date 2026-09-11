//
//  RecommendationTextCard.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/12/26.
//

import SwiftUI

struct RecommendationTextCard: View {
    var recommended: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if recommended {
                    Text(RecommendationTextGen.recommendationSample)
                } else {
                    Text(RecommendationTextGen.searchSample)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    Background {
        RecommendationTextCard(recommended: true)
    }
}

//
//  ReviewInputCard.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/22/26.
//

import SwiftUI

struct ReviewInputCard<Content: View>: View {
    var catName: String
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(catName)
                .font(.title3)
            content
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
        .background(.white, in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    Background {
        ReviewInputCard(catName: "Network Coverage") {
            Text("Content")
        }
    }
}

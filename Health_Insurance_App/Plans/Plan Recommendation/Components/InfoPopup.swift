//
//  InfoPopup.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/1/26.
//

import SwiftUI

struct InfoPopup: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(.purple)
                    .frame(width: 45, height: 20)
                Spacer()
                Text("Expensive, but safer")
                    .font(.footnote)
                    .foregroundColor(.black)
            }
            
            HStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(.blue)
                    .frame(width: 45, height: 20)
                Spacer()
                Text("Moderate, recommended")
                    .font(.footnote)
                    .foregroundColor(.black)
            }
            
            HStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(.green)
                    .frame(width: 45, height: 20)
                Spacer()
                Text("Cheaper, but riskier")
                    .font(.footnote)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .frame(width: 250)
        .liquidGlass()
    }
}

#Preview {
    Background {
        InfoPopup()
    }
}

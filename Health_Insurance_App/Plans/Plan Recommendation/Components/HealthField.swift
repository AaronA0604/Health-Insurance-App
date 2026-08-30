//
//  HealthField.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/12/26.
//

import SwiftUI

struct HealthField<Content: View>: View {
    var iconName: String
    var label: String
    @ViewBuilder var content: Content
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .resizable()
                .foregroundColor(Color("AccentColor"))
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)
            Text(label)
            Spacer()
            content
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
        .background(.white, in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    NavigationStack {
        Background {
            HealthField(iconName: "person.fill", label: "Label") {
                Text("Content")
            }
        }
    }
}

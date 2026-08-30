//
//  WheelButton.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/30/26.
//

import SwiftUI

struct WheelButton: View {
    var label: String
    @Binding var selection: Int
    var unit: String
    
    @Binding var isExpanded: Bool
    let type: ActiveWheel
    
    @Binding var activeWheel: ActiveWheel?
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                activeWheel = type
                isExpanded = true
            }
        }) {
            HStack {
                Text("\(selection) \(unit)")
                    .tint(.primary)
                Image(systemName: "chevron.up.chevron.down")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(.white, in: RoundedRectangle(cornerRadius: 16))
        }
        .background(
            GeometryReader { geo in
                Color.clear
                    .anchorPreference(
                        key: WheelAnchorKey.self,
                        value: .bounds
                    ) { [type: $0] }
            }
        )
    }
}

struct DoubleWheelButton: View {
    @Binding var selection1: Int
    var unit1: String
    
    @Binding var selection2: Int
    var unit2: String
    
    @Binding var doubleIsExpanded: Bool
    let type: ActiveWheel
    @Binding var activeWheel: ActiveWheel?
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                activeWheel = type
                doubleIsExpanded = true
            }
        }) {
            HStack {
                Text("\(selection1) \(unit1)")
                    .tint(.primary)
                Text("\(selection2) \(unit2)")
                    .tint(.primary)
                Image(systemName: "chevron.up.chevron.down")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(.white, in: RoundedRectangle(cornerRadius: 16))
        }
        .background(
            GeometryReader { geo in
                Color.clear
                    .anchorPreference(
                        key: WheelAnchorKey.self,
                        value: .bounds
                    ) { [type: $0] }
            }
        )
    }
}

#Preview {
    Background {
        WheelButton(
            label: "Weight",
            selection: .constant(150),
            unit: "pounds",
            isExpanded: .constant(false),
            type: .weight,
            activeWheel: .constant(.weight)
        )
    }
}

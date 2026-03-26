//
//  ExpandableWheel.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/27/26.
//

import SwiftUI

struct ExpandableWheel: View {
    var label: String
    @Binding var selection: Int
    var range: ClosedRange<Int>
    var unit: String

    @Binding var isExpanded: Bool

    var body: some View {
//        ZStack {
//            Color.clear
//                .contentShape(Rectangle())
//                .ignoresSafeArea()
//                .onTapGesture {
//                    withAnimation(.easeInOut) {
//                        isExpanded = false
//                    }
//
//                }
            
            Picker(label, selection: $selection) {
                ForEach(range, id: \.self) { number in
                    Text("\(number) \(unit)")
                        .tag(number)
                }
            }
            .pickerStyle(.wheel)
            .frame(width: 250, height: 180)
            .liquidGlass()
//        }
    }
}

struct DoubleWheel: View {
    var label1: String
    @Binding var selection1: Int
    var range1: ClosedRange<Int>
    var unit1: String

    var label2: String
    @Binding var selection2: Int
    var range2: ClosedRange<Int>
    var unit2: String
    
    @Binding var doubleIsExpanded: Bool
    
    var body: some View {
//        ZStack {
//            Color.clear
//                .contentShape(Rectangle())
//                .ignoresSafeArea()
//                .onTapGesture {
//                    withAnimation(.easeInOut) {
//                        doubleIsExpanded = false
//                    }
//                }
            
            HStack {
                Picker(label1, selection: $selection1) {
                    ForEach(range1, id: \.self) { number in
                        Text("\(number) \(unit1)")
                            .tag(number)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 125, height: 180)
                
                Picker(label2, selection: $selection2) {
                    ForEach(range2, id: \.self) { number in
                        Text("\(number) \(unit2)")
                            .tag(number)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 125, height: 180)
            }
            .liquidGlass()
//        }
    }
}

#Preview {
    Background {
        ExpandableWheel(
            label: "Weight",
            selection: .constant(150),
            range: 1...800,
            unit: "pounds",
            isExpanded: .constant(false)
        )
    }
}

//
//  SortPlansPopup.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 9/20/26.
//

import SwiftUI

struct SortPlansPopup: View {
    @ObservedObject var vm: PlansViewModel
        
    var onDismiss: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(SortingFactors.allCases.enumerated()), id: \.element.id) { index, filter in
                Button {
                    vm.sortPlans(by: filter)
                    onDismiss()
                } label: {
                    HStack {
                        Text(filter.rawValue)
                        Spacer()
                        
                        if vm.currentSort == filter {
                            Image(systemName: "checkmark")
                        }
                    }
                }
                .buttonStyle(.plain)
                
                if index < SortingFactors.allCases.count - 1 {
                    Divider()
                        .overlay(Color.black)
                }
            }
        }
        .padding()
        .frame(width: 250)
        .liquidGlass()    }
}

#Preview {
    Background {
        SortPlansPopup(vm: PlansViewModel()) {
            print("Dismissed tapped in preview")
        }
    }
}

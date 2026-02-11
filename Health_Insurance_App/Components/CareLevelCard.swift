//
//  CareLevelCard.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/3/26.
//

import SwiftUI

struct CareLevelCard: View {
    let spending: SpendingVars
    
    var body: some View {
        VStack {
            HStack {
                Text(spending.level)
                    .font(.headline)
                Spacer()
            }
            Divider()
            HStack {
                Text("General Pracitioner")
                Spacer()
                Text(spending.genPrac, format: .currency(code: "USD"))
            }
            Divider()
            HStack {
                Text("Specialist")
                Spacer()
                Text(spending.specialist, format: .currency(code: "USD"))
            }
            Divider()
            HStack {
                Text("Hospital")
                Spacer()
                Text(spending.hospital, format: .currency(code: "USD"))
            }
            Divider()
            HStack {
                Text("Pharmacy")
                Spacer()
                Text(spending.pharmacy, format: .currency(code: "USD"))
            }
            Divider()
            HStack {
                Text("Lab")
                Spacer()
                Text(spending.lab, format: .currency(code: "USD"))
            }
            Divider()
            HStack {
                Text("Total")
                Spacer()
                Text(spending.total, format: .currency(code: "USD"))
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background(.white, in: RoundedRectangle(cornerRadius: 16))

    }
}

#Preview {
    Background {
        CareLevelCard(
            spending: SpendingVars(
                level: "Preventative Care",
                genPrac: 0.00,
                specialist: 0.00,
                hospital: 0.00,
                pharmacy: 35.00,
                lab: 0.00
            )
        )
    }
}

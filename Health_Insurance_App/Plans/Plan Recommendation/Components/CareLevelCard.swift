//
//  CareLevelCard.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/3/26.
//

import SwiftUI


struct CareLevelCard: View {
    let spending: SpendingVars
    
    var rows: [(label: String, value: Decimal)] {
        [
            ("General Practitioner", spending.genPrac),
            ("Specialist", spending.specialist),
            ("Hospital", spending.hospital),
            ("Pharmacy", spending.pharmacy),
            ("Lab", spending.lab),
            ("Total", spending.total)
        ]
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(spending.level)
                    .font(.headline)
                Spacer()
            }

            ForEach(rows.indices, id: \.self) { index in
                Divider()
                HStack {
                    Text(rows[index].label)
                    Spacer()
                    Text(rows[index].value, format:.currency(code: "USD"))
                }
            }
        }
        .padding()
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

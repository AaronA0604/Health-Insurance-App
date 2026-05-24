//
//  StarRating.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/22/26.
//

import SwiftUI

struct StarRating: View {
    @Binding var rating: Int
    let maxRating = 5
    
    var body: some View {
        GeometryReader { geometry in
            let totalWidth = geometry.size.width
            let starWidth = totalWidth / CGFloat(maxRating)
            
            HStack {
                ForEach(1...maxRating, id: \.self) { index in
                    Image(systemName: index <= rating ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                        .font(.system(size: 32))
                        .frame(maxWidth: .infinity)
                }
            }
            .contentShape(Rectangle())
            
            // TAP
            .gesture(
                SpatialTapGesture()
                    .onEnded { value in
                        let x = value.location.x
                        let newRating = min(max(Int(x / starWidth) + 1, 1), maxRating)
                        rating = newRating
                    }
            )
            .animation(.spring(response: 0.25, dampingFraction: 0.7), value: rating)
            
            // DRAG
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                        let x = value.location.x
                        let newRating = min(max(Int(x / starWidth) + 1, 1), maxRating)
                        rating = newRating
                    }
            )
            .animation(.spring(response: 0.25, dampingFraction: 0.7), value: rating)
        }
        .frame(height: 50)
    }
}

#Preview {
    @Previewable @State var rating = 0
    StarRating(rating: $rating)
}

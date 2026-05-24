//
//  LiquidGlass.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/1/26.
//


import SwiftUI

struct LiquidGlass<Content: View>: View {
    let content: Content
    var tintColor: Color? = nil
    var isInteractive: Bool = true

    init(tint: Color? = nil, isInteractive: Bool = true, @ViewBuilder content: () -> Content) {
        self.tintColor = tint
        self.isInteractive = isInteractive
        self.content = content()
    }

    var body: some View {
        content
            .padding(16)
            .glassEffect(buildGlassEffect(), in: RoundedRectangle(cornerRadius: 32)) // Apply the effect with custom shape
            .shadow(color: Color.black.opacity(0.18), radius: 18, y: 18) // Add subtle shadow for depth
    }
    
    private func buildGlassEffect() -> Glass {
        // TODO: maybe make it Glass.clear and play around with the tint
        var effect = Glass.regular
        if let tint = tintColor {
            effect = effect.tint(tint) // Apply optional tint
        }
        if isInteractive {
            effect = effect.interactive() // Makes it responsive to touch/hover
        }
        return effect
    }
}

extension View {
    func liquidGlass() -> some View {
        LiquidGlass {
            self
        }
    }
}

// Preview
#Preview {
    Background {
        ZStack {
            Image(systemName: "scribble.variable")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            LiquidGlass(isInteractive: true) {
                VStack {
                    Text("Liquid Glass")
                        .font(.title2)
                    Text("Lorem ipsum.")
                        .font(.body)
                }
            }
        }
    }
}

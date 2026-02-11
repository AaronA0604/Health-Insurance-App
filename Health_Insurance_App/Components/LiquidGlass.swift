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
    var cornerRadius: CGFloat = 28.0

    init(tint: Color? = nil, isInteractive: Bool = true, cornerRadius: CGFloat = 28.0, @ViewBuilder content: () -> Content) {
        self.tintColor = tint
        self.isInteractive = isInteractive
        self.cornerRadius = cornerRadius
        self.content = content()
    }

    var body: some View {
        content
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)) // Use a defined padding style
            .glassEffect(buildGlassEffect(), in: RoundedRectangle(cornerRadius: cornerRadius)) // Apply the effect with custom shape
            .shadow(color: Color.black.opacity(0.18), radius: 18, y: 8) // Add subtle shadow for depth
    }
    
    private func buildGlassEffect() -> Glass {
        var effect = Glass.regular
        if let tint = tintColor {
            effect = effect.tint(tint) // Apply optional tint
        }
        if isInteractive {
            effect = effect.interactive() // Make it responsive to touch/hover
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
    ZStack {
        // A moving background is essential for the glass effect to be visible
        Color.blue.ignoresSafeArea()
        
        LiquidGlass(tint: .purple, isInteractive: true) {
            VStack {
                Label("Hello, Liquid Glass", systemImage: "sparkles")
                    .font(.title2)
                    .foregroundColor(.white)
                Text("This is a custom themed card.")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .frame(width: 250, height: 150)
    }
}

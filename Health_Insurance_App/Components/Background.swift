//
//  Background.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/12/26.
//

import SwiftUI

struct Background<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()

            content
        }
    }
}

#Preview {
    Background {
        Text("Hello World")
    }
}

// TODO: fix cutoff on recommendations page

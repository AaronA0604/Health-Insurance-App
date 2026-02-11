//
//  PredictionsView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/1/26.
//

import SwiftUI

struct PredictionsView: View {
    @StateObject var vm = PredictionsViewModel()
    
    var body: some View {
        Background {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(Array(vm.predictions)) { prediction in
                        CareLevelCard(spending: prediction)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Predictions")
        }
    }
}

#Preview {
    NavigationStack {
        PredictionsView()
    }
}

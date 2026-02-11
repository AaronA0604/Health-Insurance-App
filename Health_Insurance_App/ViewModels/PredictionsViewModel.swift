//
//  PredictionsViewModel.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/3/26.
//

import Foundation
import SwiftUI
internal import Combine

@MainActor
class PredictionsViewModel: ObservableObject {

    @Published private(set) var predictions: [SpendingVars] = []

    init() {
        // TODO: Replace with deterministic engine call
        self.predictions = PredictedExpendentures.sample
    }
}

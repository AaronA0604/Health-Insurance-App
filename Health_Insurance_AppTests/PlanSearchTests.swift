//
//  PlanSearchTests.swift
//  PlanSearchTests
//
//  Created by Aaron Aslan on 8/28/26.
//

import Testing
@testable import Health_Insurance_App

struct PlanSearchTests {
    @MainActor
    @Test func arrayContainsKeys() async throws {
        let engine = PlanFilteringEngine()
        
        #expect(!engine.qualifyingKeys.isEmpty)
    }
}

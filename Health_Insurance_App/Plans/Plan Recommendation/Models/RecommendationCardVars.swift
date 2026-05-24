//
//  RecommendationCardVars.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/1/26.
//

import Foundation
import SwiftUI

struct RecommendationCardVars: Identifiable {
    var id: String
    // TODO: make id a UUID() that persists through a database
    var planName: String
    var deductible: Decimal
    var premium: Decimal
    var isRecommended: Bool
}

//
//  RiskProfile.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 4/23/26.
//

import Foundation

enum RiskProfile: String, Identifiable, CaseIterable, Hashable {
    case lphr   // low premium and high risk
    case balanced   // in the middle
    case hplr   // high premium and low risk
    
    var id: String {
        rawValue
    }
}

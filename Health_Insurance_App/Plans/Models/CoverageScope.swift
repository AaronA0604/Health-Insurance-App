//
//  CoverageScope.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 5/22/26.
//

import Foundation

import Foundation

enum CoverageScope: String, Identifiable, CaseIterable, Hashable {
    case local
    case regional
    case national
    
    var id: String {
        rawValue
    }
}

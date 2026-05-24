//
//  NetworkType.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 4/23/26.
//

import Foundation

enum NetworkType: String, Identifiable, CaseIterable {
    case hmo
    case ppo
    case epo
    case pos
    case indemity
    case pffs
    
    var id: String {
        rawValue
    }
}

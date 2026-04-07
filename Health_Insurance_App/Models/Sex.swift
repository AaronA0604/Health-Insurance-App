//
//  Sex.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/12/26.
//

import Foundation

enum Sex: String, Identifiable, CaseIterable {
    case male
    case female
    
    var id: String {
        rawValue
    }
}

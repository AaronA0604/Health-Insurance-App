//
//  CostDisplayable.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 9/23/26.
//


import Foundation

protocol CostDisplayable {
    var id: String { get }
    var planName: String { get }
    var deductible: Decimal { get }
    var premium: Decimal { get }
}

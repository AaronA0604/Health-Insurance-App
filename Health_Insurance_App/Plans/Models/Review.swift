//
//  Review.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 3/13/26.
//

import Foundation

struct Review: Codable, Identifiable {
    var id: UUID
    let planID: String
    var date: Date
    
    var netCov: Int    // Network coverage
    var netCovText: String
    var com: Int    // Communication
    var comText: String
    var service: Int    // Costumer service
    var serviceText: String
    
    init(
        id: UUID = UUID(),
        planID: String,
        date: Date = Date(),
        netCov: Int = 0,
        netCovText: String = "",
        com: Int = 0,
        comText: String = "",
        service: Int = 0,
        serviceText: String = ""
    ) {
        self.id = id
        self.planID = planID
        self.date = date
        self.netCov = netCov
        self.netCovText = netCovText
        self.com = com
        self.comText = comText
        self.service = service
        self.serviceText = serviceText
    }
    
    static var empty = Review(planID: "TEMP")
}

//
//  HealthInfo.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/11/26.
//

import Foundation

struct HealthInfo {
    var sex: Sex
    var birthday: Date
    var numPrescriptions: Int?
    var height: Int?    // in inches
    var weight: Int?
    var ZIPCode: String = ""

    static var empty = HealthInfo(sex: .male, birthday: Calendar.current.date(from: DateComponents(year: 2000, month: 1, day: 1))!)
    static var sample: HealthInfo {
        let calendar = Calendar.current
        let sampleDate = calendar.date(from: DateComponents(year: 1982, month: 6, day: 12))!

        return HealthInfo(
            sex: .male,
            birthday: sampleDate,
            numPrescriptions: 4,
            height: 70,
            weight: 180,
            ZIPCode: "90210"
        )
    }
}

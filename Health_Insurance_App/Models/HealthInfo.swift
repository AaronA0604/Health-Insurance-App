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
    var numPrescriptions: Int = 0
    var inches: Int = 8
    var feet: Int = 5
    var height: Int {   // in inches
        feet * 12 + inches
    }
    var weight: Int = 150
    var ZIPCode: String = ""

    static var sample: HealthInfo {
        let calendar = Calendar.current
        let sampleDate = calendar.date(from: DateComponents(year: 1982, month: 6, day: 12))!

        return HealthInfo(
            sex: .male,
            birthday: sampleDate,
            ZIPCode: "90210"
        )
    }
}

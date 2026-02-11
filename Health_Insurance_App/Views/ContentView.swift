//
//  ContentView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var healthInfo = HealthInfo(
        sex: .male,
        birthday: Calendar.current.date(from: DateComponents(year: 2000, month: 1, day: 1)
        )!
    )
    
    var body: some View {
        TabView() {
            NavigationStack {
                VStack {
                    HealthInfoView(healthInfo: $healthInfo)
                }
            }
            .tabItem {
                Label("Plans", systemImage: "cross.case.fill")
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

#Preview {
    ContentView()
}

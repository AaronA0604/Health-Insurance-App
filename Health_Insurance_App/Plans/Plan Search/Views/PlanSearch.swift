//
//  PlanSearch.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 4/19/26.
//

import SwiftUI

struct PlanSearch: View {
    @StateObject var vm = PlansViewModel()
    @State private var selection: Int = 0
    
    var body: some View {
        Background {
            ScrollView {
                VStack {
                    ForEach(Array(vm.planCardModels.enumerated()), id: \.element.id) { index, plan in
                        NavigationLink {
                            PlanDetailsView(selection: index)
                        } label: {
                            PlanCard(plan: plan)
                        }
                        .tint(.primary)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Plan Search")
        }
    }
}

#Preview {
    NavigationStack {
        PlanSearch()
    }
}

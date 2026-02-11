//
//  HealthInfoView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/12/26.
//

import SwiftUI

struct HealthInfoView: View {
    @Binding var healthInfo: HealthInfo
    var formIsComplete: Bool {
        (healthInfo.numPrescriptions ?? 0) > 0 &&
        (healthInfo.height ?? 0) > 0 &&
        (healthInfo.weight ?? 0) > 0 &&
        !healthInfo.ZIPCode.isEmpty
    }
    
    var body: some View {
        Background {
            ScrollView {
                VStack {
                    // sex
                    HealthField(iconName: "person.fill", label: "Sex") {
                        Picker("Sex", selection: $healthInfo.sex) {
                            ForEach(Sex.allCases) { sex in
                                Text(sex.rawValue.capitalized)
                                    .tag(sex)
                            }
                        }
                        .frame(width: 150)
                        .pickerStyle(.segmented)
                    }
                    
                    // birthday
                    HealthField(iconName: "calendar", label: "Date of Birth") {
                        DatePicker("Date of Birth", selection: $healthInfo.birthday, displayedComponents: [.date])
                            .labelsHidden()
                    }
                    
                    // number of pills
                    HealthField(iconName: "pills.fill", label: "Number of Prescriptions") {
                        TextField("prescriptions", value: $healthInfo.numPrescriptions, format: .number)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .accessibilityLabel("Number of Prescriptions")
                    }
                    
                    // height
                    HealthField(iconName: "ruler", label: "Height") {
                        TextField("inches", value: $healthInfo.height, format: .number)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .accessibilityLabel("Height")
                    }
                    
                    // weight
                    HealthField(iconName: "scalemass.fill", label: "Weight") {
                        TextField("pounds", value: $healthInfo.weight, format: .number)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .accessibilityLabel("Weight")
                    }
                    
                    // ZIP code
                    HealthField(iconName: "mappin.and.ellipse", label: "ZIP Code") {
                        TextField("ZIP Code", text: $healthInfo.ZIPCode)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .accessibilityLabel("ZIP Code")
                    }
                    // TODO: add function that checks if ZIP code is real
                    
                    // TODO: add the rest of the inputs based on the dataset
                    
                    NavigationLink {
                        RecommendationView()
                    } label: {
                        Text("Submit")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.tint, in: RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(.white)
                    }
                    .disabled(!formIsComplete)
                    // TODO: make the navigation link run the prediction model
                }
                .padding(.horizontal)
            }
            .onAppear {
                healthInfo = .sample
            }
            // TODO: remove the sample data in final version
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("Health Information")
        }
    }
}

#Preview {
    @Previewable @State var healthInfo = HealthInfo.empty
    NavigationStack {
        HealthInfoView(healthInfo: $healthInfo)
    }
}

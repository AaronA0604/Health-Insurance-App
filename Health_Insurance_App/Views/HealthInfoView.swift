//
//  HealthInfoView.swift
//  Health_Insurance_App
//
//  Created by Aaron Aslan on 2/12/26.
//

import SwiftUI

struct HealthInfoView: View {
    @Binding var healthInfo: HealthInfo
    @State private var activeWheel: ActiveWheel? = nil
    @State private var isExpanded = false
    @State private var doubleIsExpanded = false
//    @State private var selectedType: WheelType? = nil
    var formIsComplete: Bool {
        !healthInfo.ZIPCode.isEmpty
    }
    
    func dismissWheel() {
        withAnimation(.easeInOut) {
            activeWheel = nil
            isExpanded = false
            doubleIsExpanded = false
        }
        // TODO: make animation better and consistent throughout app
    }
    
//    func binding(for type: WheelType) -> Binding<Int> {
//        switch type {
//        case .weight: return $healthInfo.weight
//        case .prescriptions: return $healthInfo.numPrescriptions
//        }
//    }
//    
//    func range(for type: WheelType) -> ClosedRange<Int> {
//        switch type {
//        case .weight: return 1...800
//        case .prescriptions: return 0...50
//        }
//    }
//
//    func unit(for type: WheelType) -> String {
//        switch type {
//        case .weight: return "pounds"
//        case .prescriptions: return ""
//        }
//    }
    
    var body: some View {
        Background {
            ZStack {
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
                            WheelButton(
                                label: "Number of Pills",
                                selection: $healthInfo.numPrescriptions,
                                unit: "",
                                isExpanded: $isExpanded,
                                type: .prescriptions,
                                activeWheel: $activeWheel
                            )
                            
//                            WheelButton(label: "Number of Pills", selection: $healthInfo.numPrescriptions, unit: "", isExpanded: $isExpanded, type: .prescriptions, selected: $selectedType)
                        }
                        
                        // height
                        HealthField(iconName: "ruler", label: "Height") {
                            DoubleWheelButton(
                                selection1: $healthInfo.feet,
                                unit1: "'",
                                selection2: $healthInfo.inches,
                                unit2: "''",
                                doubleIsExpanded: $doubleIsExpanded,
                                type: .height,
                                activeWheel: $activeWheel
                            )
                            
//                            DoubleWheelButton(label: "Height", selection1: $healthInfo.feet, unit1: "'", selection2: $healthInfo.inches, unit2: "''", doubleIsExpanded: $doubleIsExpanded)
                        }
                        
                        // weight
                        HealthField(iconName: "scalemass.fill", label: "Weight") {
                            WheelButton(
                                label: "Weight",
                                selection: $healthInfo.weight,
                                unit: "pounds",
                                isExpanded: $isExpanded,
                                type: .weight,
                                activeWheel: $activeWheel
                            )
                            
//                            WheelButton(label: "Weight", selection: $healthInfo.weight, unit: "pounds", isExpanded: $isExpanded, type: .weight, selected: $selectedType)
                            // TODO: make it say "pound" when value is 1
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
                .scrollDismissesKeyboard(.interactively)
                .navigationTitle("Health Information")
            }
            .overlayPreferenceValue(WheelAnchorKey.self) { anchors in
                GeometryReader { proxy in
                    if let activeWheel,
                       let anchor = anchors[activeWheel] {
                        
                        let frame = proxy[anchor]
                        
                        ZStack {
                            Color.clear
                                .contentShape(Rectangle())
                                .ignoresSafeArea()
                                .onTapGesture {
                                    dismissWheel()
                                }
                            
                            switch activeWheel {
                                
                            case .weight:
                                ExpandableWheel(
                                    label: "Weight",
                                    selection: $healthInfo.weight,
                                    range: 1...800,
                                    unit: "pounds",
                                    isExpanded: $isExpanded
                                )
                                .position(
                                    x: frame.maxX - 140,
                                    y: frame.minY - 120
                                )
                                
                            case .prescriptions:
                                ExpandableWheel(
                                    label: "Number of Pills",
                                    selection: $healthInfo.numPrescriptions,
                                    range: 0...50,
                                    unit: "",
                                    isExpanded: $isExpanded
                                )
                                .position(
                                    x: frame.maxX - 140,
                                    y: frame.maxY + 120
                                )
                                
                            case .height:
                                DoubleWheel(
                                    label1: "Feet",
                                    selection1: $healthInfo.feet,
                                    range1: 1...8,
                                    unit1: "'",
                                    label2: "Inches",
                                    selection2: $healthInfo.inches,
                                    range2: 1...12,
                                    unit2: "''",
                                    doubleIsExpanded: $doubleIsExpanded
                                )
                                .position(
                                    x: frame.maxX - 140,
                                    y: frame.minY - 120
                                )
                            }
                        }
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.height
                        )
                    }
                }
            }
            
//            .overlayPreferenceValue(WheelAnchorKey.self) { anchors in
//                GeometryReader { proxy in
//                    if let activeWheel,
//                       let anchor = anchors[activeWheel] {
//                        
//                        let frame = proxy[anchor]
//                        
//                        ZStack {
//                            // background tap dismiss
//                            Color.black
//                                .contentShape(Rectangle())
//                                .ignoresSafeArea()
//                                .onTapGesture {
//                                    withAnimation(.easeInOut) {
//                                        self.activeWheel = nil
//                                    }
//                                }
//                            
//                            switch activeWheel {
//                                
//                            case .weight:
//                                ExpandableWheel(
//                                    label: "Weight",
//                                    selection: $healthInfo.weight,
//                                    range: 1...800,
//                                    unit: "pounds",
//                                    isExpanded: .constant(true) // no longer used
//                                )
//                                
//                            case .prescriptions:
//                                ExpandableWheel(
//                                    label: "Number of Pills",
//                                    selection: $healthInfo.numPrescriptions,
//                                    range: 0...50,
//                                    unit: "",
//                                    isExpanded: .constant(true)
//                                )
//                                
//                            case .height:
//                                DoubleWheel(
//                                    label1: "Feet",
//                                    selection1: $healthInfo.feet,
//                                    range1: 1...8,
//                                    unit1: "'",
//                                    label2: "Inches",
//                                    selection2: $healthInfo.inches,
//                                    range2: 1...12,
//                                    unit2: "''",
//                                    doubleIsExpanded: .constant(true)
//                                )
//                            }
//                        }
//                        .position(
//                            x: frame.maxX - 140,
//                            y: frame.minY - 120
//                        )
//                    }
//                }
//            }
            
//          .overlayPreferenceValue(WheelButtonAnchorKey.self) { anchors in
//                GeometryReader { proxy in
//                    if isExpanded,
//                        let type = selectedType,
//                        let anchor = anchors[type] {
//                    
//                        let frame = proxy[anchor]
//                        
//                        ExpandableWheel(
//                            label: type == .weight ? "Weight" : "Number of Pills",
//                            selection: binding(for: type),
//                            range: range(for: type),
//                            unit: unit(for: type),
//                            isExpanded: $isExpanded
//                        )
//                        .position(
//                            x: frame.maxX - 140,
//                            y: frame.minY - 120
//                        )
//                    }
//                }
//            }
//            .overlayPreferenceValue(DoubleWheelAnchorKey.self) { anchor in
//                GeometryReader { proxy in
//                    if doubleIsExpanded,
//                       let anchor = anchor {
//                        
//                        let frame = proxy[anchor]
//                        
//                        DoubleWheel(
//                            label1: "Feet",
//                            selection1: $healthInfo.feet,
//                            range1: 1...8,
//                            unit1: "'",
//                            label2: "Inches",
//                            selection2: $healthInfo.inches,
//                            range2: 1...12,
//                            unit2: "''",
//                            doubleIsExpanded: $doubleIsExpanded
//                        )
//                        .position(
//                            x: frame.maxX - 140,
//                            y: frame.minY - 120
//                        )
//                    }
//                }
//            }
        }
    }
}

#Preview {
    @Previewable @State var healthInfo = HealthInfo.sample
    NavigationStack {
        HealthInfoView(healthInfo: $healthInfo)
    }
}

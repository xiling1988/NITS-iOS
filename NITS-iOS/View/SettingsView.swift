//
//  SettingsView.swift
//  NITS-iOS
//
//  Created by Emirates on 02/06/2022.
//
import SwiftUI

//class SettingsModel: BindableObject {
//    var didChange = PassthroughSubject<Void, Never>()
//    var aircraftTypes = ["A380-3C", "A380-2C", "777-200", "777-300-2C", "777-300-3C"]
//    var acType = "A380-3C"
//}


struct SettingsView: View {
    @EnvironmentObject var settings : SettingsModel
    
    var body: some View {
        NavigationView {
        VStack {
            Form {
                Section {
                    HStack {
                        Text("Aircraft Type")
                        Spacer()
                        Picker(selection: $settings.acType) {
                            ForEach(settings.aircraftTypes, id: \.self) { aircraft in
                                Text(aircraft)
                            }} label: {
                                Text(settings.acType)
                            }
                            .pickerStyle(.menu)
                    }
                    .padding()
                }
            }
        }
                .navigationTitle("Settings")
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(SettingsModel())
    }
}

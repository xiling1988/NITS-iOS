//
//  HomeView.swift
//  NITS-iOS
//
//  Created by Emirates on 28/05/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var settings : SettingsModel
    @EnvironmentObject var nature : NatureModel
    @EnvironmentObject var timerManager : TimerManager
    @EnvironmentObject var specifics : SpecificsModel
    @EnvironmentObject var intentions : IntentionsModel
    
    @State var settingsPressed  = false
    var body: some View {
        VStack {
            HStack {
                Button {
                    nature.catSelection = "Other"
                    nature.description = ""
                    
                    intentions.catSelection = "Other"
                    intentions.description = ""
                    
                    timerManager.reset()
                    timerManager.timerMode = .initial
                    
                    specifics.description = ""
                } label: {
                    Label("Reset", systemImage: "gobackward")
                }
                .font(.largeTitle)
                .padding()
                .foregroundColor(.secondary)
                Spacer()
                Button {
                    settingsPressed.toggle()
                } label: {
                    Label("", systemImage: "gear")
                }
                .font(.largeTitle)
                .padding()
                .foregroundColor(.secondary)
            }
            Spacer()
            VStack(alignment: .center, spacing: 15) {
                Text("Welcome To Nits").font(.largeTitle)
                Text("Please select Aircraft Type in Settings")
                    .font(.callout)
                Text("Press first Tab to begin")
            }
            
            Spacer()
            Divider()
        }
        .sheet(isPresented: $settingsPressed) {
            SettingsView()
        }
            
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(SettingsModel())
            .environmentObject(TimerManager())
            .environmentObject(SpecificsModel())
            .environmentObject(NatureModel())
            .environmentObject(IntentionsModel())
    }
}

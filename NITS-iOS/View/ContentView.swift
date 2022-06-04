//
//  ContentView.swift
//  NITS-iOS
//
//  Created by Emirates on 28/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var timerManager = TimerManager()
    @StateObject var nature = NatureModel()
    @StateObject var intentions = IntentionsModel()
    @StateObject var specifics = SpecificsModel()
    @StateObject var settings = SettingsModel()
    
    
    var body: some View {
        TabBar()
            .environmentObject(timerManager)
            .environmentObject(nature)
            .environmentObject(intentions)
            .environmentObject(specifics)
            .environmentObject(settings)
            
            
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

//
//  TabBar.swift
//  NITS-iOS
//
//  Created by Emirates on 28/05/2022.
//

import SwiftUI

struct TabBar: View {
    
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            NatureView()
                .tabItem {
                    Image(systemName: "n.square")
                    Text("Nature")
                }
            IntentionsView()
                .tabItem {
                    Image(systemName: "i.square")
                    Text("Intentions")
                }
            TimeView()
                .tabItem {
                    Image(systemName: "t.square")
                    Text("Time")
                }
            SpecificsView()
                .tabItem {
                    Image(systemName: "s.square")
                    Text("Specifics")
                }
        }
        
    }
        
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TimerManager())
            .environmentObject(NatureModel())
            .environmentObject(IntentionsModel())
            .environmentObject(SpecificsModel())
            .environmentObject(SettingsModel())
    }
}

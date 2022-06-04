//
//  BriefingSheet.swift
//  NITS-iOS
//
//  Created by Emirates on 04/06/2022.
//

import SwiftUI

struct BriefingSheet: View {
    @EnvironmentObject var nature : NatureModel
    @EnvironmentObject var intentions : IntentionsModel
    @EnvironmentObject var timerManager : TimerManager
    @EnvironmentObject var specifics : SpecificsModel
    @EnvironmentObject var settings : SettingsModel
    var body: some View {
        NavigationView {
            ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Please confirm all stations are present before conducting briefing and read briefing out loud")
                    .padding()
                Divider()
                
                VStack(alignment: .leading, spacing: 40) {
                    
                    Group {
                        Text("This is a NITS Briefing. Please listen carefully and take notes of the following informations and instructions.")
                    }
                    
                    Group {
                        Text("The Captain has informed me of a\(nature.catSelection == "Other" ? "n" : " \(nature.catSelection)") issue with following details:")
                        Text("\(nature.description)")
                    }.lineSpacing(10)
                    
                    
                    
                    Group {
                        Text("The Intentions of the Captain are to perform \(intentions.catSelection == "Other" ? "the following:" : "a \(intentions.catSelection) with the following details:")")
                        Text(intentions.description)
                    }
                    
                    
                    Group {
                        Text("The time available given by the Captain stands now at \(timeFormatter(seconds: timerManager.secondsLeft)) minutes.")
                    }
                    
                    Group {
                        Text("The specific Instructions for this operation are as follows:")
                        Text(specifics.description)
                        
                        if intentions.catSelection == "Ditching" {
                            
                            if settings.acType == "777-300-2C" || settings.acType == "777-300-3C" {
                            Text("Please confirm your presence positions L3")
                            Text("Please confirm your presence positions R3")
                            Text("L3 and R3 stay on the line: prepare (disarm) your doors and crosscheck, NOW.")
                            }
                        }
                    }
                }
            .navigationTitle("Briefing Sheet")
            .padding()
        }
            }
    }
    }
}
struct BriefingSheet_Previews: PreviewProvider {
    static var previews: some View {
        BriefingSheet()
            .environmentObject(NatureModel())
            .environmentObject(IntentionsModel())
            .environmentObject(TimerManager())
            .environmentObject(SettingsModel())
    }
}

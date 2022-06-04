//
//  TimeView.swift
//  NITS-iOS
//
//  Created by Emirates on 28/05/2022.
//

import SwiftUI

struct TimeView: View {
    @EnvironmentObject var timerManager : TimerManager
    @State var selectedPickerIndex: Int = 0
    let availableMinutes = Array(1...59)
    @State var timerMode: TimerMode = .initial
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text(timeFormatter(seconds: timerManager.secondsLeft))
                    .font(.largeTitle)
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable().scaledToFit()
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        if timerManager.timerMode == .initial {
                            timerManager.setTimerLength(minutes: (availableMinutes[selectedPickerIndex])*60)
                            timerManager.start()
                        } else if timerManager.timerMode == .running {
                            timerManager.pause()
                        } else if timerManager.timerMode == .paused {
                            timerManager.start()
                        }
                    }
                if timerManager.timerMode == .paused {
                    Image(systemName: "gobackward")
                        .padding()
                        .font(.title)
                        .onTapGesture {
                            timerManager.reset()
                        }
                }
                if timerManager.timerMode == .initial {
                    Picker(selection: $selectedPickerIndex) {
                        ForEach(0..<availableMinutes.count, id: \.self) {
                            Text("\(availableMinutes[$0]) min")
                        }
                    } label: {
                        Text("Minutes")
                    }
                    .pickerStyle(.wheel)
                    
                }

                Spacer()
                Spacer()
            }
            .navigationTitle(Text("Time Available"))
            
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
            .environmentObject(TimerManager())
    }
}

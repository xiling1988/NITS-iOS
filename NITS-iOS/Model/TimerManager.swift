//
//  TimerManager.swift
//  NITS-iOS
//
//  Created by Emirates on 03/06/2022.
//
import Combine
import SwiftUI

class TimerManager: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = 60
    
    var timer = Timer()
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.secondsLeft > 0 {
                self.secondsLeft -= 1
            } else {
                timer.invalidate()
                self.reset()
            }}
        }
    
    func reset() {
        timerMode = .initial
        timer.invalidate()
//        setTimerLength(minutes: 60)
        secondsLeft = 60
    }
    
    func pause() {
        timerMode = .paused
        timer.invalidate()
    }
    
    func setTimerLength(minutes: Int) {
        let defaults = UserDefaults.standard

        defaults.setValue(minutes, forKey: "timerLength")

        self.secondsLeft = minutes
    }
        
}


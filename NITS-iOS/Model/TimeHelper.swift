//
//  TimeHelper.swift
//  NITS-iOS
//
//  Created by Emirates on 03/06/2022.
//

import Foundation

enum TimerMode {
    case initial
    case running
    case paused
}

func timeFormatter(seconds: Int) -> String {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondsStamp = seconds.count > 1 ? seconds : "0" + seconds
    
    return "\(minuteStamp):\(secondsStamp)"
}

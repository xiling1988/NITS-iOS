//
//  IntentionsModel.swift
//  NITS-iOS
//
//  Created by Emirates on 03/06/2022.
//

import Foundation

class IntentionsModel : ObservableObject {
    let scenarios = ["Emergency Landing", "Ditching", "Prev. Disembarkation", "Return To Stand", "Other"]
    var catSelection = "Other"
    var description : String = ""
}

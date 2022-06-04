//
//  NatureModel.swift
//  NITS-iOS
//
//  Created by Emirates on 30/05/2022.
//

import SwiftUI

class NatureModel : ObservableObject {
    let categories = ["Mechanical", "Medical", "Security", "Operational", "Other"]
    var catSelection = "Other"
    var description : String = ""
}

//
//  UserSettings.swift
//  AR Calculator
//
//  Created by Johnson Zhou on 15/08/2018.
//  Copyright © 2018 Johnson Zhou. All rights reserved.
//

import Foundation

enum GraphType {
    case lineScalar
    case lineVector
    case curveScalar
    case planeScalar
    case planeVector
}

class UserSettings: NSObject, NSCoding {
    
    var type: GraphType
    
    init(type: GraphType) {
        self.type = type
    }
    
    
}

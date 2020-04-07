//
//  UserDefaultsKey.swift
//  Soap WatchKit App Extension
//
//  Created by Trevin Wisaksana on 04/04/20.
//  Copyright © 2020 Trevin Wisaksana. All rights reserved.
//

import Foundation

enum UserDefaultsKey: String {
    
    case HandWashCounter = "com.soap.handWashCounter"
    case LastSaveDate = "com.soap.LastSaveDate"
    
    var key: String {
        return rawValue
    }
    
}

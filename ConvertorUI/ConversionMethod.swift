//
//  ConversionMethod.swift
//  ConvertorUI
//
//  Created by Tomas Martins on 11/10/19.
//  Copyright © 2019 Tomas Martins. All rights reserved.
//

import Foundation

enum ConversionMethod {
    case temperature
    case lenght
    case time
    case volume
    
    var units: [String] {
        switch self {
        case .temperature:
            return ["ºC", "ºF", "K"]
        case .lenght:
            return ["km", "m", "ft", "yd", "miles"]
        case .time:
            return ["second", "hour", "hour", "day"]
        case .volume:
            return ["ml", "l", "cups", "pints", "galoon"]
        }
    }
}

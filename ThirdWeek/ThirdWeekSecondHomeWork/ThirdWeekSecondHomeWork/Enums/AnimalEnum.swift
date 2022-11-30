//
//  AnimalEnum.swift
//  ThirdWeekSecondHomeWork
//
//  Created by Ali Rıza İLHAN on 21.11.2022.
//

import Foundation

enum AnimalType : String, CaseIterable {
    case cat
    case dog
    case bird
    case lion
    case elephant
    
    var sound: String {
        switch self {
        case .cat: return "cat"
        case .dog: return "dog"
        case .bird:return "dove"
        case .lion: return "lion"
        case .elephant:return "elephant"
        }
    }
}

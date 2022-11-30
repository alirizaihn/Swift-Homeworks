//
//  userType.swift
//  ThirdWeekHomeWork
//
//  Created by Ali Rıza İLHAN on 18.11.2022.
//

import Foundation

enum UserType: String, CaseIterable {
    
    case jr
    case mid
    case sr
    
    var multiplier: Int {
        switch self {
        case .jr: return 1
        case .mid: return 2
        case .sr: return 4
        }
    }
}

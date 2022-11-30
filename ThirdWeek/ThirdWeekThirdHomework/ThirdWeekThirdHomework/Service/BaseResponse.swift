//
//  BaseResponse.swift
//  ThirdWeekThirdHomework
//
//  Created by Ali Rıza İLHAN on 20.11.2022.
//

import Foundation

struct BaseResponse: Codable {
    let status: Int
    let error: String
}

extension BaseResponse: LocalizedError {
    var errorDescription: String? {
        return error
    }
}

//
//  emplotableProtocol.swift
//  ThirdWeekHomeWork
//
//  Created by Ali Rıza İLHAN on 18.11.2022.
//

import Foundation

protocol Employable: Values {
    var employees: [Employee] { get set }
    mutating func addEmploye(_ employe: Employee)
}

//
//  companyModal.swift
//  ThirdWeekHomeWork
//
//  Created by Ali Rıza İLHAN on 18.11.2022.
//

import Foundation

struct Company: Employable {
    var name: String
    var foundationYear: Int
    var budget: Int?
    var employees: [Employee] = []
    var totalSalary: Int {
        var salary = 0
        for i in self.employees {
            salary += i.salary ?? 0
        }
        return salary
    }
    
    init(name: String, foundationYear: Int, budget: Int) {
        self.name = name
        self.foundationYear = foundationYear
        self.budget = budget
    }
    mutating func addEmploye(_ employee: Employee) {
        
        employees.append(employee)
        print("Basda \(employees)")
    }
    mutating func addMoneyToBudget(_ money: Int) {
        if money > 0 {
            self.budget = money + (self.budget ?? 0)
            print("Money added, new budget value => \(self.budget ?? 0)")
        } else {
            print("Money couldn't be added, money should be bigger than 0")
        }
    }
    mutating func getMoneyFromBudget(_ money: Int) {
        if money > 0 {
            if let budgetMoney = self.budget {
                if budgetMoney - money >= 0 {
                    self.budget = budgetMoney - money
                    print("Money was taken, new budget value => \(self.budget ?? 0)")
                } else {
                    print("Budget is not enough")
                }
            }
        } else {
            print("Failed. Money should be bigger than 0")
        }
    }
    mutating func paySalary(
        completion: (_ newBudget: String) -> Void, onFailure: (_ errorMessage: String) -> Void
    ) {
        if self.totalSalary > 0 {
            if let budgetMoney = self.budget {
                if budgetMoney - self.totalSalary >= 0 {
                    self.budget = budgetMoney - self.totalSalary
                    completion(
                        "Payment Successful, Paid money => \(self.totalSalary), New budget value => \(self.budget ?? 0)"
                    )
                } else {
                    onFailure("Budget isn't enough")
                }
            } else {
                onFailure("Payment Failed")
            }
        } else {
            onFailure("No salary to be paid")
        }
        
    }
}

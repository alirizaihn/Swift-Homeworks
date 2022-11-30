//
//  ZooModel.swift
//  ThirdWeekSecondHomeWork
//
//  Created by Ali Rıza İLHAN on 21.11.2022.
//

import Foundation

struct Zoo {
    var animals: [Animal] = []
    var zooKeepers: [ZooKeeper] = []
    var waterLimit: Int
    var dailyWaterRequirement: Int {
        var waterRequerement = 0
        for i in self.animals {
            waterRequerement += i.waterRequirement
        }
        return waterRequerement
    }
    var budget: Int?
    var totalSalary: Int {
        var salary = 0
        for i in self.zooKeepers {
            salary += i.salary
        }
        return salary
    }
    init(waterLimit: Int, budget: Int) {
        self.budget = budget
        self.waterLimit = waterLimit
    }
    mutating func addMoneyToBudget(_ money: Int, completion: (String) -> Void) {
        if money > 0 {
            self.budget = money + (self.budget ?? 0)
            completion("Money added, new budget value => \(self.budget ?? 0)")
        } else {
            completion("Money couldn't be added, money should be bigger than 0")
        }
    }
    mutating func getMoneyFromBudget(_ money: Int, completion: (String) -> Void) {
        if money > 0 {
            if let budgetMoney = self.budget {
                if budgetMoney - money >= 0 {
                    self.budget = budgetMoney - money
                    completion("Money was taken, new budget value => \(self.budget ?? 0)")
                } else {
                    completion("Budget is not enough")
                }
            }
        } else {
            completion("Failed. Money should be bigger than 0")
        }
    }
    mutating func addWater(_ water: Int, completion: (String) -> Void) {
        if water > 0 {
            self.waterLimit = water + (self.waterLimit)
            completion("Water added, new water value => \(self.waterLimit)")
        } else {
            completion("Water couldn't be added, Water value should be bigger than 0")
        }
    }
    mutating func getWater(_ water: Int, completion: @escaping (String?) -> Void) {
        if water > 0 {
                if self.waterLimit - water >= 0 {
                    self.waterLimit -= water
                    completion("Water was taken, new stock value => \(self.waterLimit ?? 0)")
                } else {
                    completion("Water stock is not enough")
                }
        } else {
            completion("Failed, Water value should be bigger than 0")
        }
    }
    mutating func serveWater(completion: @escaping (String?) -> Void) {
        if self.animals.count > 0 {
            if self.waterLimit - self.dailyWaterRequirement >= 0 {
                for var i in self.animals {
                    i.drinkWater()
                }
                self.waterLimit -= self.dailyWaterRequirement
                completion("Water is served")
            } else {
                completion("Water is not enough")
            }
        } else {
            completion("No animals to water")
        }
    }
    mutating func paySalary(completion: @escaping (String?) -> Void) {
        if self.totalSalary > 0 {
            if let budgetMoney = self.budget {
                if budgetMoney - self.totalSalary >= 0 {
                    self.budget = budgetMoney - self.totalSalary
                    completion(
                        "Payment Successful, Paid money => \(self.totalSalary), New budget value => \(self.budget ?? 0)"
                    )
                } else {
                    completion("Budget isn't enough")
                }
            } else {
                completion("Payment Failed")
            }
        } else {
            completion("No salary to be paid")
        }
        
    }
    mutating func addZookeeper(_ newZooKeeper: ZooKeeper) {
        
            self.zooKeepers.append(newZooKeeper)        
    }
    mutating func addAnimal(_ newAnimal: Animal, completion: @escaping (String?) -> Void) {
        if self.zooKeepers.count > 0 {
                var animal = newAnimal
                var index = Int.random(in: 0..<zooKeepers.count)
                animal.setZooKeeper(zooKeeper: self.zooKeepers[index])
                self.zooKeepers[index].addNewAnimal(newAnimal)
                self.animals.append(animal)
        } else {
            completion("Failed, There are not zookeeper")
        }
    }
}

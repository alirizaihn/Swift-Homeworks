//
//  ZookeeperModel.swift
//  ThirdWeekSecondHomeWork
//
//  Created by Ali Rıza İLHAN on 21.11.2022.
//

import Foundation

struct ZooKeeper {
    var name: String = ""
    var animals: [Animal] = []
    var experiance: Int = 0
    var salary: Int {
        return (self.experiance * 2) * (self.animals.count + 1) * 1000
    }
    init(name: String, experiance: Int) {
        self.name = name
        self.experiance = experiance
    }
    mutating func addNewAnimal(_ newAnimal: Animal) {
        self.animals.append(newAnimal)
    }
}

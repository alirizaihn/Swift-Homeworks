//
//  Animal.swift
//  ThirdWeekSecondHomeWork
//
//  Created by Ali Rıza İLHAN on 21.11.2022.
//

import Foundation

protocol AnimalProtocol {
    var name: String { get set }
    var sound: String { get set }
    var animalType: AnimalType {get set}
    var zooKeeper: ZooKeeper? { get set }
    var waterRequirement: Int { get set }
    init()
    mutating func drinkWater()
    mutating func setZooKeeper(zooKeeper: ZooKeeper)
    func getSound()
}
extension AnimalProtocol {
    init(_ name: String, _ sound: String, _ waterRequirement: Int, _ animalType: AnimalType) {
        self.init()
        self.name = name
        self.sound = sound
        self.animalType = animalType
        self.waterRequirement = waterRequirement
    }
    func drinkWater() {
        print("\(self.sound) - \(self.waterRequirement)")
    }
    mutating func setZooKeeper(zooKeeper: ZooKeeper) {
        self.zooKeeper = zooKeeper
    }
}

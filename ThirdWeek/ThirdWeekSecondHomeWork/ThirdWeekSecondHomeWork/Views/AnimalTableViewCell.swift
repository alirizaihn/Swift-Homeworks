//
//  AnimalTableViewCell.swift
//  ThirdWeekSecondHomeWork
//
//  Created by Ali Rıza İLHAN on 22.11.2022.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var zookeeperLabel: UILabel!
    
    
    func configureCell(model: Animal) {
        nameLabel.text = "Name: " + String(model.name)
        typeLabel.text = "Type: " + String(model.animalType.rawValue)
        zookeeperLabel.text = "Zookeeper: " + String(model.zooKeeper?.name ?? "-")
    }
    
}

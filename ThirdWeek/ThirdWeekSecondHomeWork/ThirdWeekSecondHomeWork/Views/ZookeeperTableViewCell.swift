//
//  ZookeeperTableViewCell.swift
//  ThirdWeekSecondHomeWork
//
//  Created by Ali Rıza İLHAN on 22.11.2022.
//

import UIKit

class ZookeeperTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var salaryLabel: UILabel!
    @IBOutlet private weak var animalsLabel: UILabel!
    
    
    func configureCell(model: ZooKeeper) {
        nameLabel.text = "Name: " + String(model.name)
        salaryLabel.text = "Salary: " + String(model.salary)
        animalsLabel.text = "Animals: " + String(model.animals.map{ $0.name}.joined(separator: "-"))
    }
}

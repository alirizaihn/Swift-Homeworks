//
//  ListViewController.swift
//  ThirdWeekSecondHomeWork
//
//  Created by Ali Rıza İLHAN on 22.11.2022.
//

import UIKit
import AVFoundation
class ListViewController: UIViewController  {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectedListSegmentControl: UISegmentedControl!
    var zoo: Zoo? = nil
    @IBOutlet private weak var zooTableView: UITableView! {
        didSet {
            zooTableView.dataSource = self
            zooTableView.delegate = self
            zooTableView.register(UINib(nibName: "AnimalTableViewCell", bundle: nil), forCellReuseIdentifier: "AnimalCell")
            zooTableView.register(UINib(nibName: "ZookeeperTableViewCell", bundle: nil), forCellReuseIdentifier: "ZookeeperCell")
            zooTableView.estimatedRowHeight = UITableView.automaticDimension
        }
    }
    private var animals: [Animal]? {
        if let animals = zoo?.animals {
            return animals
        } else {
            return [Animal]()
        }
    }
    private var zookeeper: [ZooKeeper]? {
        if let zookeeper = zoo?.zooKeepers {
            return zookeeper
        } else {
            return [ZooKeeper]()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedListSegmentControl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
    }
    @objc func handleSegmentChange() {
        titleLabel.text = selectedListSegmentControl.selectedSegmentIndex == 0 ? "Animals Table" : "Zookeepers Table"
        zooTableView.reloadData()
    }
}
extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedListSegmentControl.selectedSegmentIndex == 0 {
            return  animals?.count ?? 0
        } else {
            return zookeeper?.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedListSegmentControl.selectedSegmentIndex == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath) as? AnimalTableViewCell, let model = animals?[indexPath.row] else {
                return UITableViewCell()
            }
            cell.configureCell(model: model)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ZookeeperCell", for: indexPath) as? ZookeeperTableViewCell, let model = zookeeper?[indexPath.row] else {
                return UITableViewCell()
            }
            cell.configureCell(model: model)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedListSegmentControl.selectedSegmentIndex == 0 {
            if var animal = animals?[indexPath.row] {
                animal.getSound()
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

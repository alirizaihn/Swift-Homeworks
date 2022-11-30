//
//  AddZooKeeperViewController.swift
//  ThirdWeekSecondHomeWork
//
//  Created by Ali Rıza İLHAN on 21.11.2022.
//

import UIKit

class AddZooKeeperViewController: UIViewController {
    var delegate: DataSendDelegateProtocol? = nil
    private var zookeeper = ZooKeeper(name: "", experiance: 0)
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var experianceTextField: UITextField!
    @IBOutlet private weak var salaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        experianceTextField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
    
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        zookeeper.experiance =  Int(textField.text ?? "0" ) ?? 0
        salaryLabel.text = "Salary: \(zookeeper.salary)"
    }
    @IBAction private func addNewZookeeperPassed(_ sender: Any) {
        self.zookeeper.name = nameTextField.text ?? ""
        if zookeeper.name != "" && zookeeper.experiance != 0 {
            dismiss(animated: true) {
                self.delegate?.sendDataToFirstViewController(zooKeeperExample: self.zookeeper)
            }
        }
        else {
            let alert = UIAlertController(title: "Info", message: "Fill in all fields", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) { UIAlertAction in
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}

//
//  ViewController.swift
//  ThirdWeekSecondHomeWork
//
//  Created by Ali Rıza İLHAN on 21.11.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var budgetLabel: UILabel!
    @IBOutlet private weak var totalSalaryLabel: UILabel!
    @IBOutlet private weak var dailyWaterReqLabel: UILabel!
    @IBOutlet private weak var waterStockLabel: UILabel!
    @IBOutlet private weak var waterTextField: UITextField!
    @IBOutlet private weak var moneyTextField: UITextField!
    var ankaZoo = Zoo(waterLimit: 400, budget: 421312)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let budget = ankaZoo.budget {
            budgetLabel.text = "Budget: " + String(budget)
        }
        waterStockLabel.text = "Water Stock: " +  String(ankaZoo.waterLimit)
        dailyWaterReqLabel.text = "Daily Water Requirement: " + String(ankaZoo.dailyWaterRequirement)
        totalSalaryLabel.text = "Total Salary: " + String(ankaZoo.totalSalary)
        print("slemasda")

    }

    @IBAction private func addZookeeperPressed(_ sender: Any) {
        guard let newZookeeperVc = storyboard?.instantiateViewController(withIdentifier: "AddZooKeeperViewController") as? AddZooKeeperViewController else { return }
        newZookeeperVc.delegate = self
        present(newZookeeperVc, animated: true)
    }
    
    @IBAction private func addAnimalPressed(_ sender: Any) {
        guard let newAnimalVc = storyboard?.instantiateViewController(withIdentifier: "AddAnimalViewController") as? AddAnimalViewController else { return }
        newAnimalVc.delegate = self
        present(newAnimalVc, animated: true)
    }
    @IBAction func showListPressed(_ sender: Any) {
        guard let pushWithIdVC = storyboard?.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else { return }
        pushWithIdVC.zoo = self.ankaZoo
        self.navigationController?.pushViewController(pushWithIdVC, animated: true)
    }
    
    private func showAlert (_ message : String) {
        let alert = UIAlertController(title: "Info", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) { UIAlertAction in
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction private func getMoneyPressed(_ sender: Any) {
        if let money = moneyTextField.text {
            ankaZoo.getMoneyFromBudget(Int(money) ?? 0) { message in
                showAlert(message)
            }
                if let budget = ankaZoo.budget {
                    budgetLabel.text = "Budget: " + String(budget)
                }
            
        }
        
    }
    @IBAction private func addMoneyPressed(_ sender: Any) {
        if let money = moneyTextField.text {
            ankaZoo.addMoneyToBudget(Int(money) ?? 0) { message in
                 showAlert(message)
                
            }
                if let budget = ankaZoo.budget {
                    budgetLabel.text = "Budget: " + String(budget)
                }
            }
        
    }
    @IBAction private func addWaterPressed(_ sender: Any) {
        if let water = waterTextField.text {
            ankaZoo.addWater(Int(water) ?? 0) { message in
                 showAlert(message)
            }
            waterStockLabel.text = "Water Stock: " + String(ankaZoo.waterLimit)
        }
    }
    
    @IBAction private func getWaterPressed(_ sender: Any) {
        if let water = waterTextField.text {
            ankaZoo.getWater(Int(water) ?? 0) { message in
                if let message = message {
                    self.showAlert(message)
                }
            }
            waterStockLabel.text = "Water Stock: " + String(ankaZoo.waterLimit)
        }
    }
    
    @IBAction func serveWaterPressed(_ sender: Any) {
        ankaZoo.serveWater() { message in
            if let message = message {
                self.showAlert(message)
            }
        }
        waterStockLabel.text = "Water Stock: " + String(ankaZoo.waterLimit)
    }
    @IBAction func paySalaryPressed(_ sender: Any) {
        ankaZoo.paySalary() { message in
            if let message = message {
                self.showAlert(message)
            }
        }
        budgetLabel.text = "Budget: " + String(ankaZoo.budget ?? 0)
    }

}
extension ViewController : DataSendDelegateProtocol {
    func sendAnimalData(animalExample: Animal) {
        ankaZoo.addAnimal(animalExample) { message in
            if let message = message {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    [weak self] in
                    self?.showAlert(message)
                }
            }
        }
        dailyWaterReqLabel.text = "Daily Water Requirement: " + String(ankaZoo.dailyWaterRequirement)
        totalSalaryLabel.text = "Total Salary: " + String(ankaZoo.totalSalary)
    }
    
    func sendDataToFirstViewController( zooKeeperExample: ZooKeeper) {
        ankaZoo.addZookeeper(zooKeeperExample)
        totalSalaryLabel.text = "Total Salary: " + String(ankaZoo.totalSalary)
    }
   
}

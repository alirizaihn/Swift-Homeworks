//
//  ViewController.swift
//  ThirdWeekHomeWork
//
//  Created by Ali Rıza İLHAN on 18.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var moneyTextField: UITextField!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    var vakifBank: Company?
    override func viewDidLoad() {
        super.viewDidLoad()
        vakifBank = Company(name: "VakıfBank", foundationYear: 1954, budget: 4_291_231_242);
        if let budget = vakifBank?.budget {
            budgetLabel.text = "Budget:\(String(budget))"
        } else {
            budgetLabel.text = "Budget: 0"
        }
        if let year = vakifBank?.foundationYear {
            yearLabel.text = "Since \(String(year))"
        } else {
            yearLabel.text = "Since 1954"
        }
    }
 
    @IBAction func addMoneyPressed(_ sender: Any) {
        if let money = Int(moneyTextField.text ?? "0") {
            vakifBank?.addMoneyToBudget(money)
            if let budget = vakifBank?.budget {
                budgetLabel.text = "Budget:\(String(budget))"
            } else {
                budgetLabel.text = "Budget: 0"
            }
            
        }
    }
    @IBAction func getMoneyPressed(_ sender: Any) {
        if let money = Int(moneyTextField.text ?? "0") {
            vakifBank?.getMoneyFromBudget(money)
            if let budget = vakifBank?.budget {
                budgetLabel.text = "Budget:\(String(budget))"
            } else {
                budgetLabel.text = "Budget: 0"
            }
        }
    }
    
    @IBAction func paySalaryPressed(_ sender: Any) {
        vakifBank?.paySalary() { (message) in
            let alert = UIAlertController(title: "Info", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) { UIAlertAction in
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        } onFailure: { message in
            let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) { UIAlertAction in
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        if let budget = vakifBank?.budget {
            budgetLabel.text = "Budget:\(String(budget))"
        } else {
            budgetLabel.text = "Budget: 0"
        }
    }
    @IBAction func addNewEmploye(_ sender: Any) {
        guard let newEmployeVC = storyboard?.instantiateViewController(withIdentifier: "NewEmployeViewControler") as? NewEmployeViewControler else { return }
        newEmployeVC.delegate = self
        present(newEmployeVC, animated: true)
    }

    @IBAction func listEmployeePressed(_ sender: Any) {
        performSegue(withIdentifier: "pushWithSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushWithSegue" {
            guard let navVc = segue.destination as? UINavigationController, let vc = navVc.viewControllers.first as? EmployeListViewControler else { return }
            vc.vakifBank = self.vakifBank
        }
    }
}
extension ViewController : MyDataSendingDelegateProtocol {
    func sendDataToFirstViewController(employeeExample: Employee) {
        vakifBank?.addEmploye(employeeExample)
        if let budget = vakifBank?.budget {
            budgetLabel.text = "Budget:\(String(budget))"
        } else {
            budgetLabel.text = "Budget: 0"
        }
    }
   
}


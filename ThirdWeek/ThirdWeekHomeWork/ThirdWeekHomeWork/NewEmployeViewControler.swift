//
//  NewEmployeViewControler.swift
//  ThirdWeekHomeWork
//
//  Created by Ali Rıza İLHAN on 18.11.2022.
//

import UIKit

class NewEmployeViewControler: UIViewController {
    var employee = Employee(name: "", age: 0, type: .jr)
    @IBOutlet weak var employeeSalary: UILabel!
    @IBOutlet weak var employeeUserType: UIPickerView!
    @IBOutlet weak var employeeName: UITextField!
    @IBOutlet weak var employeeAge: UITextField!
    var delegate : MyDataSendingDelegateProtocol? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeUserType.dataSource = self
        employeeUserType.delegate = self
        employeeAge.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
       
    }
    
    @IBAction func saveUserButtonPassed(_ sender: Any) {
        if(employeeName.text != "" && Int(employeeAge.text ?? "0" ) != 0) {
            employee.name = String(employeeName.text ?? "")
            employee.age = Int(employeeAge.text ?? "0" )!
            self.delegate?.sendDataToFirstViewController(employeeExample: employee)
            dismiss(animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Fill in all fields", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) { UIAlertAction in
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        employee.age =  Int(textField.text ?? "0" ) ?? 0
        employeeSalary.text = "Salary: \(employee.salary)"
    }

}

extension NewEmployeViewControler : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        UserType.allCases.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UserType.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        employee.type = UserType.allCases[row]
        employeeSalary.text = "Salary: \(employee.salary)"
    }
    
}


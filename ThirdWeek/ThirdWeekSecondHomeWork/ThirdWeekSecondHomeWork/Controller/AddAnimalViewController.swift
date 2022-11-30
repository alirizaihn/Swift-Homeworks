//
//  AddAnimalViewController.swift
//  ThirdWeekSecondHomeWork
//
//  Created by Ali Rıza İLHAN on 21.11.2022.
//

import UIKit

class AddAnimalViewController: UIViewController {

    @IBOutlet private weak var pickerTopConst: NSLayoutConstraint!
    @IBOutlet weak var selectAnimalTypesButton: UIButton!
    @IBOutlet private weak var animalTypePicker: UIPickerView!
    @IBOutlet weak var animalNameTextField: UITextField!
    @IBOutlet weak var waterRequirementTextField: UITextField!
    private var animalType: AnimalType? = nil
    var delegate: DataSendDelegateProtocol? = nil
    var newAnimal: Animal? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        animalTypePicker.dataSource = self
        animalTypePicker.delegate = self

    }
    
    @IBAction func showPickerPassed(_ sender: Any) {
        pickerTopConst.constant = -180
    }
    @IBAction func addNewAnimalPressed(_ sender: Any) {
        if animalNameTextField.text != "" && waterRequirementTextField.text != "" && animalType != nil {
            newAnimal = Animal( String(animalNameTextField.text ?? ""), animalType!.sound, Int(waterRequirementTextField.text!) ?? 0, animalType!)
            self.delegate?.sendAnimalData(animalExample: newAnimal!)
            dismiss(animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Fill in all fields", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) { UIAlertAction in
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}

extension AddAnimalViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        AnimalType.allCases.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        AnimalType.allCases[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectAnimalTypesButton.setTitle(AnimalType.allCases[row].rawValue, for: .normal)
        pickerTopConst.constant = 0
        animalType = AnimalType.allCases[row]
        
    }
    
}

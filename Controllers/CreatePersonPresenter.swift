//
//  CreateController.swift
//  CompleteTableViewExample
//
//  Created by Trainer on 10/17/17.
//  Copyright © 2017 Trainer. All rights reserved.
//

import UIKit

class CreatePersonPresenter: UIViewController {
    
    var _firstName: String?
    @IBOutlet weak var firstNameInput: UITextField!
    var _lastName: String?
    @IBOutlet weak var lastNameInput: UITextField!
    var _age: Int?
    @IBOutlet weak var ageInput: UITextField!
    var _address: String?
    @IBOutlet weak var addressInput: UITextField!
    var _educationDegree: Education?
    @IBOutlet weak var educationDegreeInput: UIPickerView!
    var _ocupation: Ocupation?
    @IBOutlet weak var ocupationInput: UIPickerView!
    var _ssn: String?
    @IBOutlet weak var ssnInput: UITextField!
    var ocupations: [Ocupation] = [.Doctor, .Engineer, .Fireman, .Police, .ProjectManager, .Teacher]
    var educations: [Education] = [.AdministrationBachelor, .BiologyBachelor, .BiologyPhd, .ComputerScienceBachelor, .ComputerScienceMaster, .ComputerSciencePhd, .MathBachelor, .MathMaster]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        educationDegreeInput.delegate = self
        educationDegreeInput.dataSource = self
        navigationItem.title = "Create new person"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let firstName = firstNameInput.text, let lastName = lastNameInput.text, let age = ageInput.text, let address = addressInput.text, let ssn = ssnInput.text {
            _firstName = firstName
            _lastName = lastName
            _age = (age as NSString).integerValue
            _address = address
            _ssn = ssn
            
        }
    }
}

extension CreatePersonPresenter: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return ocupations[row].rawValue
        }else{
            return educations[row].rawValue
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return ocupations.count
        }else{
            return educations.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            _ocupation = ocupations[row]
        }else{
            _educationDegree = educations[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
}



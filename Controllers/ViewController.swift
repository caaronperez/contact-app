//
//  ViewController.swift
//  HW-DAY8E4
//
//  Created by MCS Devices on 10/15/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

struct segueIdentifiers {
    static let presentPerson = "presentPerson"
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    private var editable = false
    private var persons: [Person] = []
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        if let source = sender.source as? CreatePersonPresenter {
            if let _firstName = source._firstName, let _lastName = source._lastName, let _address = source._address, let _age = source._age, let _ssn = source._ssn, let _educationDegree = source._educationDegree, let _ocupation = source._ocupation, _firstName.characters.count > 0,  _lastName.characters.count > 0,  _address.characters.count > 0,  _age > 0,  _ssn.characters.count > 0 {
                
                persons.append(Person(firstName: _firstName, lastName: _lastName, avatar: "empty" , age: _age, address: _address, ssn: _ssn, ocupation: _ocupation, educationDegree: _educationDegree))
                tableView.reloadData()
            }
        }
    }

    @IBAction func didPressEdit(_ sender: Any) {
        editable = editable ? false : true
        editButton.title = editable ? "Done" : "Edit"
        tableView.setEditing(editable, animated: true)
    }
    
    fileprivate func setTitles() {
        navigationItem.title = "Persons"
        editButton.title = "Edit"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initElements()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController {
    
    fileprivate func initElements() {
        
        let mapacheP = Person(firstName: "Mapache", lastName: "Hernandez", avatar: "mapache", age: 2, address: "Second trash can", ssn: "23-233-234", ocupation: Ocupation.Police, educationDegree: Education.ComputerSciencePhd)
        let doctorP = Person(firstName: "Dr. Psiquiatra", lastName: "Trevino", avatar: "doctor", age: 32, address: "222 Decatur Roading", ssn: "299-33-232", ocupation: Ocupation.Doctor, educationDegree: Education.BiologyBachelor)
        let teacherP = Person(firstName: "Valeria", lastName: "Yuen", avatar: "teacher", age: 28, address: "120 Peachtree St.", ssn: "399-23-99", ocupation: Ocupation.Teacher, educationDegree: Education.MathMaster)
        let engineerP = Person(firstName: "Pamelo", lastName: "Rodriguez", avatar: "engineer", age: 22, address: "Insurgentes 14", ssn: "22-329-99", ocupation: Ocupation.ProjectManager, educationDegree: Education.AdministrationBachelor)
        let personTwoP = Person(firstName: "Samantha", lastName: "Ochoa", avatar: "womanone", age: 33, address: "Armada de Mexico 233", ssn: "902-99-332", ocupation: Ocupation.Fireman, educationDegree: Education.BiologyBachelor)
        let personOneP = Person(firstName: "Axel", lastName: "Torres", avatar: "womantwo", age: 23, address: "Peten 680, Col. Letran Valle, Ciudad de Mexico, C.P. 87000", ssn: "883-88-238", ocupation: Ocupation.Teacher, educationDegree: Education.ComputerSciencePhd)
        
        persons = [mapacheP, doctorP, teacherP, engineerP, personTwoP, personOneP]
        tableView.isEditing = editable
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: "TableViewCellController" , bundle: nil), forCellReuseIdentifier: "TableViewCellController")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellController", for: indexPath) as! TableViewCellController
        
        cell.nameLabel.text = "\(persons[indexPath.row].firstName) \(persons[indexPath.row].lastName)"
        cell.ageLabel.text = "Age: \(persons[indexPath.row].age) years"
        cell.userImage.layer.cornerRadius = cell.userImage.frame.size.width/4
        cell.userImage.clipsToBounds = true
     
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.init(red: 0.5, green: 0.8, blue: 0.3, alpha: 0.3) :  UIColor.white
        
        if let uimage = persons[indexPath.row].avatar {
            cell.userImage.image = UIImage(named: uimage)
        } else {
            cell.userImage.image = #imageLiteral(resourceName: "empty")
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifiers.presentPerson, sender: nil)
    }
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifiers.presentPerson {
            if let nextViewController = segue.destination as? PersonPresenter, let indexRow = tableView.indexPathForSelectedRow?.row {
                nextViewController.currentModel = persons[indexRow]
            }
        }
    }
    
}


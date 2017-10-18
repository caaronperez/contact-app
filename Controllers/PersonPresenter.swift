//
//  CharacterDetail.swift
//  CompleteTableViewExample
//
//  Created by Trainer on 10/17/17.
//  Copyright © 2017 Trainer. All rights reserved.
//

import UIKit
import Foundation

class PersonPresenter: UIViewController {
    
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var ocupationLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ssnLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!

    var currentModel: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstName = currentModel?.firstName, let lastName = currentModel?.firstName{
            navigationItem.title = "\(firstName) \(lastName)"
        } else {
            navigationItem.title = "Details"
        }
        
        userImage.layer.cornerRadius = userImage.frame.size.width/2
        userImage.clipsToBounds = true
        
        if let imageUser = currentModel?.avatar {
            userImage.image = UIImage(named: imageUser)
        } else {
            userImage.image = #imageLiteral(resourceName: "empty")
        }
        
        if let age = currentModel?.age, let address = currentModel?.address, let ssn = currentModel?.ssn, let ocupation = currentModel?.ocupation.rawValue, let education = currentModel?.educationDegree.rawValue {
            ageLabel.text = "\(age) years"
            educationLabel.text = "\(education)"
            ocupationLabel.text = "\(ocupation)"
            addressLabel.text = "\(address)"
            ssnLabel.text = "\(ssn)"
            
        }
        
    }
}



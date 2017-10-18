//
//  Person.swift
//  contact-app
//
//  Created by MCS Devices on 10/17/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    private var _firstName: String, _lastName: String, _avatar: String?, _age: Int, _address: String, _ssn: String, _ocupation: Ocupation, _educationDegree: Education
    
    init(firstName: String, lastName: String, avatar: String, age: Int, address: String, ssn: String, ocupation: Ocupation, educationDegree: Education){
        self._firstName = firstName
        self._lastName = lastName
        self._avatar = avatar
        self._age = age
        self._address = address
        self._ssn = ssn
        self._ocupation = ocupation
        self._educationDegree = educationDegree
    }
    
    var firstName: String{
        set{
            self._firstName = newValue
        }get{
            return self._firstName
        }
    }
    
    var lastName: String{
        set{
            self._lastName = newValue
        }get{
            return self._lastName
        }
    }
    
    var avatar: String?{
        set{
            self._avatar = newValue
        }get{
            return self._avatar
        }
    }
    
    var age: Int{
        set{
            self._age = newValue
        }get{
            return self._age
        }
    }
    
    var address: String{
        set{
            self._address = newValue
        }get{
            return self._address
        }
    }
    
    var ssn: String{
        set{
            self._ssn = newValue
        }get{
            return self._ssn
        }
    }
    
    var ocupation: Ocupation{
        set{
            self._ocupation = newValue
        }get{
            return self._ocupation
        }
    }
    
    var educationDegree: Education{
        set{
            self._educationDegree = newValue
        }get{
            return self._educationDegree
        }
    }
}

enum Education : String  {
    case ComputerScienceBachelor = "Computer Science Bachelor"
    case AdministrationBachelor = "Administration Bachelor"
    case BiologyBachelor = "Biology Bachelor"
    case MathBachelor = "Math Bachelor"
    case MathMaster = "Math Master"
    case ComputerScienceMaster = "Computer Science Master"
    case ComputerSciencePhd = "Computer Science Phd"
    case BiologyPhd = "Biology Phd"
    
    static let count: Int = {
        var max: String = ""
        var counter = 0
        while let _ = Education(rawValue: max) { counter += 1 }
        return counter
    }()
}


enum Ocupation : String {
    case Engineer = "Engineer"
    case Doctor = "Doctor"
    case Teacher = "Teacher"
    case ProjectManager = "Project Manager"
    case Fireman = "Fireman"
    case Police = "Police"
    
    static let count: Int = {
        var max: String = ""
        var counter = 0
        while let _ = Ocupation(rawValue: max) { counter += 1 }
        return counter
    }()
}

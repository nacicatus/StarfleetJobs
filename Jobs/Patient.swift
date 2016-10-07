//
//  Patient.swift
//  Jobs
//
//  Created by Saurabh Sikka on 07/10/16.
//  Copyright © 2016 Saurabh Sikka. All rights reserved.
//

import Foundation
import RealmSwift

class Patient: Object {
    
    dynamic var firstName = ""
    dynamic var lastName = ""
   
    dynamic var hospitalId = ""
    dynamic var admissionId = ""
    dynamic var profilePicture: UIImage!
    dynamic var workingDiagnosis = ""
    
    var tasks = List<Task>()
    var age: Int!
    var gender: Gender!
    var attending: Doctor!
    
    enum Gender {
        case Male
        case Female
        case Indeterminate
    }

    convenience init(firstName: String, lastName: String, age: Int, gender: Gender) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
}

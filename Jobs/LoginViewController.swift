//
//  LoginViewController.swift
//  Jobs
//
//  Created by Saurabh Sikka on 07/10/16.
//  Copyright © 2016 Saurabh Sikka. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    
    // UI elements of note
    @IBOutlet weak var employeeIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // Validate login
    @IBAction func loginButtonPressed(sender: UIButton) {
        
        let employeeIdentification = employeeIdTextField.text!
        let password = passwordTextField.text!
        
        // check if fields are empty
        if employeeIdentification.isEmpty || password.isEmpty {
            displayAlertMessage("All Fields are required")
        }
    }
    
    func displayAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
}

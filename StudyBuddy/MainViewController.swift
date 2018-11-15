//
//  ViewController.swift
//  StudyBuddy
//
//  Created by Jamal Williams on 10/17/18.
//  Copyright © 2018 Jamal Williams. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        print("Login button pressed \n")
       
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        print("Sign up button pressed \n")
        
        
    }
}


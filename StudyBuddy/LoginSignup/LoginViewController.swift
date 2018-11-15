//
//  LoginViewController.swift
//  StudyBuddy
//
//  Created by Jamal Williams on 11/14/18.
//  Copyright © 2018 Jamal Williams. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    //Initializer
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var usernameInputTextField: UITextField!
    @IBOutlet var passwordInputTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        //Use Guard if you are using multiple storyboards.
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let homeNC = mainStoryboard.instantiateViewController(withIdentifier: "HomeNavController") as? HomeNavController else {
            print("Couldn't find desired View Controller")
            return
        }
        //Set Transition Style during presenting
        homeNC.modalTransitionStyle = .crossDissolve
        
        present(homeNC, animated: true, completion: nil)
    }
    

}

//
//  SignUp2ViewController.swift
//  StudyBuddy
//
//  Created by Jamal Williams on 10/17/18.
//  Copyright © 2018 Jamal Williams. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var signUpLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var usernameInputTextField: UITextField!
    @IBOutlet var passwordInputTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameInputTextField.resignFirstResponder()
        passwordInputTextField.resignFirstResponder()
        return false
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if let username = self.usernameInputTextField.text {
            if let password = self.passwordInputTextField.text {
                print("The Username is: \(username) The Password is: \(password)")
                
                //1. Initiate storyboard to desire view controller you want to present
                let signUp2VC = storyboard?.instantiateViewController(withIdentifier: "SignUp2ViewController") as! SignUp2ViewController
                //2. Set it equal to the var in the next view controller
                signUp2VC.displayText = self.usernameInputTextField.text!
                //3. move to next view controller through nav control
                self.navigationController?.pushViewController(signUp2VC, animated: true)
                //present(signUp2VC, animated: true, completion: nil) //3. Second way to present
            }
            
        }
    }
    
    
    
    
    
}

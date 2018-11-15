//
//  HomeViewController.swift
//  StudyBuddy
//
//  Created by Jamal Williams on 11/14/18.
//  Copyright © 2018 Jamal Williams. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    
    //Navigation Bar Items
    @IBOutlet var logoutBarButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    //Right Bar Button
    @IBAction func logoutBarButtonPressed(_ sender: Any) {
        
        //Dismiss the VC that presented this modally.
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}

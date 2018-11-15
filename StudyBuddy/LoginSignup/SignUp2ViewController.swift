//
//  SignUpViewController.swift
//  StudyBuddy
//
//  Created by Jamal Williams on 10/17/18.
//  Copyright © 2018 Jamal Williams. All rights reserved.
//

import UIKit
import Foundation

class SignUp2ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{

    
    //Welcome label
    var displayText = "Welcome"
    @IBOutlet weak var displayLabel: UILabel!
    
    //Personal Info Labels
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var schoolLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    //Personal Info Text Input Fields
    @IBOutlet var nameInputField: UITextField!
    @IBOutlet var emailInputField: UITextField!
    @IBOutlet var ageInputField: UITextField!
    @IBOutlet var schoolInputField: UITextField!
    @IBOutlet var phoneNumberInputField: UITextField!
    
    //TextView
    @IBOutlet var profileInfoView: UITextView!
    @IBOutlet var textViewLabel: UILabel!
    
    
    
    //Create Picker/Toolbar
    let picker = UIPickerView()
    let toolBar = UIToolbar()
    var doneCount = 0
    var chosenCount = 0
    
    //Age Data
    var ageData: [String] = []
    var age = 5
    var ageData1 = Array(5...100)
    var selectedAge: String?
    
    //School Data
    var schoolData: [String] = ["Old Dominion University", "American National University", "Averett University", "Blue Ridge Community College","Bluefield College", "Bridgewater College", "Central Virginia Community College", "Central Virginia Community College"]
    var selectedSchool: String?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayLabel.text = "Welcome " + displayText
        
        //Picker/Toolbar deegates
        picker.delegate = self
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:
            #selector(SignUp2ViewController.dismissKeyboard))
        let nextButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action:
            #selector(SignUp2ViewController.nextButtonPressed))
        toolBar.setItems([doneButton, nextButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        profileInfoView.isHidden = true
        textViewLabel.isHidden = true
        chooseName()
        nameInputField.becomeFirstResponder()
        //setSchoolData()
        setAgeData()
    
    }
    
    @objc func dismissKeyboard() {
        doneCount = 1
        print("DONE BUTTON- 1")
        view.endEditing(true)
    }
    
    @objc func nextButtonPressed() {
        doneCount = 0
        view.endEditing(true)
    }
    
    
    //Set Age Data for PickerView
    func setAgeData(){
    //creating array of int strings for AGE
    var ageString = String(age)
    for _ in ageData1 {
        ageData.append(ageString)
        age += 1
        ageString = String(age)
        }
    }
    
    //Set School Data for PickerView
    func setSchoolData(){
     
        let path = "~/Users/JWills/Downloads/College_.txt"
        
        do {
            let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            print(content)
            
        } catch let error as NSError {
            print("Error: ", error)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == nameInputField{
            chosenCount = 1
            nameInputField.inputAccessoryView = toolBar
            chooseName()
        }
        if textField == emailInputField{
            chosenCount = 2
            emailInputField.inputAccessoryView = toolBar
            chooseEmail()
        }
        if textField == ageInputField{
            chosenCount = 3
            ageInputField.inputView = picker
            ageInputField.inputAccessoryView = toolBar
            chooseAge()
        }
        if textField == schoolInputField{
            chosenCount = 4
            schoolInputField.inputView = picker
            schoolInputField.inputAccessoryView = toolBar
            chooseSchool()
        }
        if textField == phoneNumberInputField{
             chosenCount = 5
            phoneNumberInputField.inputAccessoryView = toolBar
            chooseNumber()
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if doneCount != 1{
        if textField == nameInputField{
           textFieldDidBeginEditing(emailInputField)
        }
        if textField == emailInputField{
           textFieldDidBeginEditing(phoneNumberInputField)
        }
        if textField == ageInputField{
            textFieldDidBeginEditing(phoneNumberInputField)

        }
        if textField == schoolInputField{
            textFieldDidBeginEditing(phoneNumberInputField)

        }
        if textField == phoneNumberInputField{
            hideAllFields()
            textViewLabel.isHidden = false
            profileInfoView.isHidden = false
            profileInfoView.text = "Name: " + nameInputField.text! + "\n" + "Username: " + displayText + " \n" + "Email: " + emailInputField.text! + "\n" + "Phone #: " + phoneNumberInputField.text!
        }
        }
        doneCount = 0
    }
    
    
    
    
    
    
    
    
    func chooseName(){
        nameLabel.isHidden = false
        nameInputField.isHidden = false
        
        emailLabel.isHidden = true
        emailInputField.isHidden = true
        ageLabel.isHidden = true
        ageInputField.isHidden = true
        schoolLabel.isHidden = true
        schoolInputField.isHidden = true
        phoneNumberLabel.isHidden = true
        phoneNumberInputField.isHidden = true
    }
    func chooseEmail(){
        emailInputField.becomeFirstResponder()
        emailLabel.isHidden = false
        emailInputField.isHidden = false
        
        nameLabel.isHidden = true
        nameInputField.isHidden = true
        ageLabel.isHidden = true
        ageInputField.isHidden = true
        schoolLabel.isHidden = true
        schoolInputField.isHidden = true
        phoneNumberLabel.isHidden = true
        phoneNumberInputField.isHidden = true
    }
    func chooseAge(){
        ageInputField.becomeFirstResponder()
        ageLabel.isHidden = false
        ageInputField.isHidden = false
        
        nameLabel.isHidden = true
        nameInputField.isHidden = true
        emailLabel.isHidden = true
        emailInputField.isHidden = true
        schoolLabel.isHidden = true
        schoolInputField.isHidden = true
        phoneNumberLabel.isHidden = true
        phoneNumberInputField.isHidden = true
    }
    func chooseSchool(){
        schoolInputField.becomeFirstResponder()
        schoolLabel.isHidden = false
        schoolInputField.isHidden = false
        
        ageLabel.isHidden = true
        ageInputField.isHidden = true
        nameLabel.isHidden = true
        nameInputField.isHidden = true
        emailLabel.isHidden = true
        emailInputField.isHidden = true
        phoneNumberLabel.isHidden = true
        phoneNumberInputField.isHidden = true
    }
    func chooseNumber(){
        phoneNumberInputField.becomeFirstResponder()
        phoneNumberLabel.isHidden = false
        phoneNumberInputField.isHidden = false
        
        schoolLabel.isHidden = true
        schoolInputField.isHidden = true
        ageLabel.isHidden = true
        ageInputField.isHidden = true
        nameLabel.isHidden = true
        nameInputField.isHidden = true
        emailLabel.isHidden = true
        emailInputField.isHidden = true
    }
    
   func  hideAllFields(){
    nameLabel.isHidden = true
    nameInputField.isHidden = true
    emailLabel.isHidden = true
    emailInputField.isHidden = true
    ageLabel.isHidden = true
    ageInputField.isHidden = true
    schoolLabel.isHidden = true
    schoolInputField.isHidden = true
    phoneNumberLabel.isHidden = true
    phoneNumberInputField.isHidden = true
    }
    
    
    
    
    //Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true) //Resign the first responders of the tex field in that container view
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Keyboard will disappear after I press return key
        nameInputField.resignFirstResponder()
        emailInputField.resignFirstResponder()
        ageInputField.resignFirstResponder()
        schoolInputField.resignFirstResponder()
        phoneNumberInputField.resignFirstResponder()
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//end of class
}



///******************************PICKER VIEW FUNCTIONS*********************************
extension SignUp2ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        print(chosenCount)
        if chosenCount == 3 {
            return ageData.count
        }
        if chosenCount == 4 {
            return schoolData.count
        } else {
           return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch chosenCount{
        case 3: return ageData.count
        case 4: return schoolData.count
        default: return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch chosenCount{
        case 3: return ageData[row]
        case 4: return schoolData[row]
        default: return ageData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch chosenCount{
        case 3: selectedAge = ageData[row]
                ageInputField.text = selectedAge
        case 4: selectedSchool = schoolData[row]
                schoolInputField.text = selectedSchool
        default: break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        //Make sure view is not nil and is a label
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Marker Felt", size: 24)
        
        switch chosenCount {
        case 3: label.text = ageData[row]
        case 4:  label.text = schoolData[row]
        default: break
        }
        return label
    }
   //End of pickerview extension
}

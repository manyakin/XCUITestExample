//
//  FeedbackViewController.swift
//  XCUITestExample
//
//  Created by Ilya Manyakin on 28/08/2019.

import UIKit

class FeedbackViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var fromField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var messageField: UITextField!
    
    @IBOutlet weak var mailError: UILabel!
    @IBOutlet weak var fromError: UILabel!
    @IBOutlet weak var phoneError: UILabel!
    @IBOutlet weak var messageError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feedback"
        self.hideKeyboardWhenTappedAround()
        
        self.setStyleField()
        self.mailField.delegate = self
        self.fromField.delegate = self
        self.phoneField.delegate = self
        self.messageField.delegate = self
        
        self.navigationController!.navigationBar.barTintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        self.navigationController!.navigationBar.tintColor = UIColor(red: 231/255, green: 196/255, blue: 86/255, alpha: 1)
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231/255, green: 196/255, blue: 86/255, alpha: 1)]
    }
   
    @IBAction func saveButton(_ sender: UIButton) {
        let mail = mailField.text!
        let from = fromField.text!
        let phone = phoneField.text!
        let message = messageField.text!
        
        let isValidateEmail = Validation().validateEmailId(emailID: mail)
        let isValidateFrom = Validation().validateFrom(name: from)
        let isValidateMessage = Validation().validateMessage(name: message)
        let isValidatePhone = Validation().validaPhoneNumber(phoneNumber: phone)
       
        if mail.isEmpty {
            errorMessage(label: mailError, text: "Please, enter email address")
        } else {
            if (isValidateEmail == false) {
                errorMessage(label: mailError, text: "Invalid email address")
            } else {
                mailError.isHidden = true
            }
        }

        if from.isEmpty {
            errorMessage(label: fromError, text: "Please, enter from field")
        } else {
            if (isValidateFrom == false) {
                errorMessage(label: fromError, text: "Please, enter 2 or more characters")
            } else {
                fromError.isHidden = true
            }
        }

        if phone.isEmpty {
            errorMessage(label: phoneError, text: "Please, enter phone number")
        } else {
            if (isValidatePhone == false) {
                errorMessage(label: phoneError, text: "Invalid phone number")
            } else {
                phoneError.isHidden = true
            }
        }

        if message.isEmpty {
            errorMessage(label: messageError, text: "Please, enter message")
        } else {
            if (isValidateMessage == false) {
                errorMessage(label: messageError, text: "Please, enter 3 or more characters")
            } else {
                messageError.isHidden = true
            }
        }

        if (isValidateFrom == true && isValidateMessage == true && isValidatePhone == true && isValidateEmail == true) {
            let alert = UIAlertController(title: nil, message: "Your message has been sent", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) {action in
                self.navigationController?.popViewController(animated: true)
            }

            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func setStyleField() {
        var myTextFields = [UITextField]()
        myTextFields = [mailField, fromField, phoneField, messageField]
        for item in myTextFields {item.setStyleTextFields()}
    }
    
    func errorMessage(label: UILabel, text: String) {
        label.text = text
        label.textColor = .red
        label.isHidden = false
    }
    
}

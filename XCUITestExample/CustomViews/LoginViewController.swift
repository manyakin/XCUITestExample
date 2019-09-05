//
//  LoginViewController.swift
//  XCUITestExample
//
//  Created by Ilya Manyakin on 28/08/2019.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Log In"
        
        self.setStyleField()
        self.loginField.delegate = self
        self.passwordField.delegate = self
        self.hideKeyboardWhenTappedAround()
        
        self.navigationController!.navigationBar.barTintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        self.navigationController!.navigationBar.tintColor = UIColor(red: 231/255, green: 196/255, blue: 86/255, alpha: 1)
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231/255, green: 196/255, blue: 86/255, alpha: 1)]
    }

    @IBAction func loginButton(_ sender: UIButton) {
        let username = loginField.text!
        let password = passwordField.text!
    
        if (username.isEmpty && password.isEmpty) {
            errorMessage(message: "Empty field username and password!")
        }
        
        if (username.isEmpty) {
            errorMessage(message: "The username field is empty!")
        }
        
        if (password.isEmpty) {
            errorMessage(message: "The password field is empty!")
        }
        
        if (username == password) {
            errorMessage(message: "Fields must not be the same!")
        }

        if (!username.isEmpty && !password.isEmpty) {
            let alert = UIAlertController(title: "Sign In", message: "Authorization completed", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) {action in
                self.navigationController?.popViewController(animated: true)
            }
            
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func setStyleField() {
        var myTextFields = [UITextField]()
        myTextFields = [loginField, passwordField]
        for item in myTextFields {item.setStyleTextFields()}
    }
    
    func errorMessage(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
}

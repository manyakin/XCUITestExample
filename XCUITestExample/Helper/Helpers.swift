//
//  helpers.swift
//  XCUITestExample
//
//  Created by Ilya Manyakin on 28/08/2019.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

extension UITextField {
    func setStyleTextFields() {
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 3.0
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}

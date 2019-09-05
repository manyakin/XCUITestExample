//
//  ViewController.swift
//  XCUITestExample
//
//  Created by Ilya Manyakin on 24/08/2019.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func CardButton(_ sender: UIButton) {}
    @IBAction func LoginButton(_ sender: UIButton) {}
    @IBAction func FeedbackButton(_ sender: UIButton) {}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Testing screens"
        self.navigationController!.navigationBar.barTintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        self.navigationController!.navigationBar.tintColor = UIColor(red: 231/255, green: 196/255, blue: 86/255, alpha: 1)
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231/255, green: 196/255, blue: 86/255, alpha: 1)]
    }
   
}

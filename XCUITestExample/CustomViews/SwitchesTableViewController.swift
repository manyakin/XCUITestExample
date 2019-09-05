//
//  SwitchesTableViewController.swift
//  XCUITestExample
//
//  Created by Ilya Manyakin on 01/09/2019.
//

import UIKit

class SwitchesTableViewController: UITableViewController {

    @IBOutlet weak var segmentFirstLabel: UILabel!
    @IBOutlet weak var segmentSecondLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var switchFirstControl: UILabel!
    @IBOutlet weak var switchSecondControl: UILabel!
    
    @IBOutlet weak var stepperLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Switches"
        
        switchControl.addTarget(self, action: #selector(switchControlState), for: .valueChanged)
        segmentControl.addTarget(self, action: #selector(segmentControlState), for: .valueChanged)
        
        self.navigationController!.navigationBar.barTintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        self.navigationController!.navigationBar.tintColor = UIColor(red: 231/255, green: 196/255, blue: 86/255, alpha: 1)
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231/255, green: 196/255, blue: 86/255, alpha: 1)]
    }
    
    @IBAction func segmentControlState(sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            segmentFirstLabel.textColor = .red
            segmentFirstLabel.isHidden = false
            segmentSecondLabel.isHidden = true
        case 1:
            segmentSecondLabel.textColor = .red
            segmentFirstLabel.isHidden = true
            segmentSecondLabel.isHidden = false
        default:
            break
        }
    }

    @IBAction func switchControlState(_ sender: UISwitch) {
        if (switchControl.isOn == true) {
            switchSecondControl.backgroundColor = .green
            switchSecondControl.isHidden = false
            switchFirstControl.isHidden = true
        } else {
            switchFirstControl.backgroundColor = .red
            switchFirstControl.isHidden = false
            switchSecondControl.isHidden = true
        }
    }

    @IBAction func stepperControl(_ sender: UIStepper) {
        stepperLabel.text = Int(sender.value).description
    }
    
}

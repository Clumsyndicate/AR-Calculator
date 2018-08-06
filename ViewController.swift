//
//  ViewController.swift
//  AR Calculator
//
//  Created by Johnson Zhou on 05/07/2018.
//  Copyright © 2018 Johnson Zhou. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    

    // UI: String handling
    
    @IBOutlet weak var numPadStack: UIStackView!
    @IBOutlet weak var eqnInputTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numPadStack.layer.cornerRadius = 5
        numPadStack.layer.borderColor = UIColor.black.cgColor
        numPadStack.layer.borderWidth = 5
        
        eqnInputTextfield.delegate = self
        
        eqnPicker.dataSource = self
        eqnPicker.delegate = self
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        eqnInputTextfield.resignFirstResponder()
    }
    
    var equation: String = "" {
        didSet {
            eqnInputTextfield.text = equation
        }
    }
    
    // UI: Actions
    
    @IBAction func numPressed(_ sender: UIButton) {
        equation += sender.currentTitle!
    }
    
    @IBAction func graph(_ sender: UIButton) {
        analyzeEqn()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Graph" {
            
        }
    }
    
    // UI: Mode Selector
    
    @IBOutlet weak var eqnPicker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("Row = ", row)
        switch row {
        case 0:
            return "Line"
        case 1:
            return "Plane"
        default:
            return ""
        }
    }
    
    // Calculator Brain
    
    private func analyzeEqn() {
        guard let equation = eqnInputTextfield.text else {
            return
        }
        
        
        
    }
    
    
}

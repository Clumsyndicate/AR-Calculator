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

class ViewController: UIViewController, ARSCNViewDelegate, UITextFieldDelegate {

    // Mark: UI
    
    @IBOutlet weak var numPadStack: UIStackView!
    @IBOutlet weak var eqnInputTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numPadStack.layer.cornerRadius = 5
        numPadStack.layer.borderColor = UIColor.black.cgColor
        numPadStack.layer.borderWidth = 5
        
        eqnInputTextfield.delegate = self
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        eqnInputTextfield.resignFirstResponder()
    }
    
    private func analyzeEqn() {
        guard let equation = eqnInputTextfield.text else {
            return
        }
        
        
        
    }
    
    @IBAction func graph(_ sender: UIButton) {
        analyzeEqn()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Graph" {
            
        }
    }
    
    
    
}

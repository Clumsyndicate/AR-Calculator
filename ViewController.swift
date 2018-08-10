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
    
    //@IBOutlet weak var numPadStack: UIStackView!
    @IBOutlet weak var eqnInputTextfield: UITextField!
    
    enum pickerViewTag: Int {
        case typeSelector  // Vector or Scalar
        case eqnSelector  // Line or Plane
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        numPadStack.layer.cornerRadius = 5
        numPadStack.layer.borderColor = UIColor.black.cgColor
        numPadStack.layer.borderWidth = 5
        */
        eqnInputTextfield.delegate = self
        
        eqnPicker.dataSource = self
        eqnPicker.delegate = self
        eqnTypePicker.dataSource = self
        eqnTypePicker.delegate = self
        
        // PickerView Tag setup
        
        eqnPicker.tag = pickerViewTag.eqnSelector.rawValue
        eqnTypePicker.tag = pickerViewTag.typeSelector.rawValue
        
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
    
    @IBAction func graph(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Graph" {
            if let vc = segue.destination as? GraphViewController {
                vc.startingPoint = analyzeEqn()
            }
        }
    }
    
    // UI: Mode Selector
    
    @IBOutlet weak var eqnPicker: UIPickerView!
    @IBOutlet weak var eqnTypePicker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("Tag = ", pickerView.tag)
        if pickerView.tag == pickerViewTag.eqnSelector.rawValue {
            switch row {
            case 0:
                return "Line"
            case 1:
                return "Plane"
            default:
                return nil
            }
        } else if pickerView.tag == pickerViewTag.typeSelector.rawValue {
            switch row {
            case 0:
                return "Scalar"
            case 1:
                return "Vector"
            default:
                return nil
            }
        }
        return nil
    }
    
    // Parameter input
    
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var c: UITextField!
    
    @IBOutlet weak var x: UITextField!
    @IBOutlet weak var y: UITextField!
    @IBOutlet weak var z: UITextField!
    
    // Calculator Brain
    
    fileprivate func str(_ field: UITextField) -> Double {
        guard let string = field.text, let num = Double(string) else {
            return 0.0
        }
        return num
    }
    
    fileprivate func coordinatesFromK(k: Double) -> SCNVector3 {
        return SCNVector3(k * str(a) + str(x), k * str(b) + str(y), k * str(c) + str(z))
    }
    
    fileprivate func analyzeEqn() -> SCNVector3 {
        
        let k = -(str(x) * str(a) + str(y) * str(b) + str(z) * str(c)) / (str(a) * str(a) + str(b) * str(b) + str(c) * str(c))
        
        let startingPoint = coordinatesFromK(k: k)
        
        print(startingPoint)
        return startingPoint
        
        
    }
    
    
}

//
//  ViewController.swift
//  Lab_3_Israel_Quinonez
//
//  Created by Israel Quinonez on 9/26/17.
//  Copyright © 2017 Israel Quinonez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var feet: UITextField!
    @IBOutlet weak var inches: UITextField!
    
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var yourBMI: UILabel!
   
    @IBAction func submit(_ sender: UIButton) {
        calculateBMI()
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func calculateBMI(){
       
        var heightFt: Float
        var heightInch: Float
        var heightTotal:Float
        var weightTotal:Float
        var BMI:Float
        
        if feet.text!.isEmpty{
            heightFt = 0.0
        }
        else{
            heightFt = Float(feet.text!)!
        }
        if inches.text!.isEmpty{
            heightInch = 0.0
        }
        else{
            heightInch = Float(inches.text!)!
        }
        heightTotal = (heightFt * 12.0) + heightInch
        if weight.text!.isEmpty{
            weightTotal = 0.0
        }
        else{
            weightTotal = Float(weight.text!)!
        }
        
        BMI = (weightTotal * 0.45) / ((heightTotal * 0.025)*(heightTotal*0.025))
        
        if (feet.text == "" || feet.text == String(0) ) || weight.text == "" || weight.text == String(0) {
            
            let alert = UIAlertController(title: "Warning" , message: "Both the height feet and weight must be greater than 0" , preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title: "Cancel" , style:UIAlertActionStyle.cancel , handler: nil)
            
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
            }
       
        
              else {
        yourBMI.text = String( BMI)
        
        }
        
    
    }
    
 
 
    
    
    
    
    override func viewDidLoad() {
        
        feet.delegate=self
        inches.delegate=self
        weight.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


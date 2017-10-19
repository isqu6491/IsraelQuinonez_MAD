//
//  Scene2ViewController.swift
//  lab4_Israel_Quinonez
//
//  Created by Israel Quinonez on 10/18/17.
//  Copyright © 2017 Israel Quinonez. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var newItemTextField: UITextField!
    
    var item1Check: String?
    var item2Check: String?
    var item3Check: String?
    var item4Check: String?
    
    
    
    
    override func viewDidLoad() {
        newItemTextField.delegate = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneAdd" {
            let scene1ViewController = segue.destination as! ViewController
            if newItemTextField.text!.isEmpty == false{
                
                
                scene1ViewController.user.item = newItemTextField.text
            
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  Ios Project 1
//
//  Created by Israel Quinonez on 10/4/17.
//  Copyright © 2017 Israel Quinonez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

   let filename = "savedData.plist"
    
    func docFilePath(_ filename: String) -> String?{
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path [0] as NSString
        return dir.appendingPathComponent(filename)
    }
    
    
    @IBOutlet weak var weekSpend: UILabel!
    @IBOutlet weak var monthSpend: UILabel!
    @IBOutlet weak var weekGoalLabel: UITextField!
    @IBOutlet weak var monthGoalLabel: UITextField!
    @IBOutlet weak var category1Label: UITextField!
    @IBOutlet weak var category2Label: UITextField!
    @IBOutlet weak var category3Label: UITextField!
    @IBOutlet weak var category1AmmountLabel: UITextField!
    @IBOutlet weak var category2AmmountLabel: UITextField!
    @IBOutlet weak var category3AmmountLabel: UITextField!
    @IBOutlet weak var category1StepperOutlet: UIStepper!
    @IBOutlet weak var category2StepperOutlet: UIStepper!
    @IBOutlet weak var category3StepperOutlet: UIStepper!
   
    var weekGoal: String?
    var currentSpend: String?

    
    
    
    
    //Goals edit
    @IBAction func weekGoalEdit(_ sender: UITextField) {
        monthGoalLabel.text = String(Int(weekGoalLabel.text!)! * 4)
    }
    
    @IBAction func monthlyGoalEdit(_ sender: UITextField) {
        weekGoalLabel.text = String(Int(monthGoalLabel.text!)! / 4)
    
    }
    
   
    //Category Edit
    @IBAction func category1Edit(_ sender: UITextField) {
    }
    
    @IBAction func category2Edit(_ sender: UITextField) {
    }

    @IBAction func category3Edit(_ sender: UITextField) {
    }
    
    // Steppers
    
    @IBAction func category1Stepper(_ sender: UIStepper) {
       
        category1AmmountLabel.text = String(Int(sender.value))
    }
    
    @IBAction func category2Stepper(_ sender: UIStepper) {
        category2AmmountLabel.text = "5"
        category2AmmountLabel.text = String(Int(sender.value))

    }
    
    @IBAction func category3Stepper(_ sender: UIStepper) {
        category3AmmountLabel.text = "5"
        category3AmmountLabel.text = String(Int(sender.value))

    }
    
    
    
    // Buttons
    
    @IBAction func category1Button(_ sender: UIButton) {
       
        if weekSpend.text == nil{
            weekSpend.text = "0"
        }
        
        if category1AmmountLabel.text == ""{
            category1AmmountLabel.text = "0"
        }
        
        weekSpend.text = String(Int(weekSpend.text!)! + Int(category1AmmountLabel.text!)!)
        monthSpend.text = weekSpend.text
        
        category1AmmountLabel.text = "5"
        category1StepperOutlet.value = 5
    }
    
    
    
    
    @IBAction func category2Button(_ sender: UIButton) {
     
        if weekSpend.text == nil{
            weekSpend.text = "0"
        }
        
        if category2AmmountLabel.text == ""{
            category2AmmountLabel.text = "0"
        }
        
        weekSpend.text = String(Int(weekSpend.text!)! + Int(category2AmmountLabel.text!)!)
        
        monthSpend.text = weekSpend.text
        
        category2AmmountLabel.text = "5"
        category2StepperOutlet.value = 5

        }
    
    @IBAction func category3Button(_ sender: UIButton) {
        
        if weekSpend.text == nil{
            weekSpend.text = "0"
        }
        
        if category3AmmountLabel.text == ""{
            category3AmmountLabel.text = "0"
        }
        
        weekSpend.text = String(Int(weekSpend.text!)! + Int(category3AmmountLabel.text!)!)
        
        monthSpend.text = weekSpend.text
        
        category3AmmountLabel.text = "5"
        category3StepperOutlet.value = 5

        }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    override func viewDidLoad() {
        
        let filePath = docFilePath(filename)
        
        if FileManager.default.fileExists(atPath: filePath!){
            let path = filePath
            
            let dataDirectory = NSDictionary(contentsOfFile: path!) as! [String:String]
            
            if dataDirectory.keys.contains("goal"){
                weekGoal = dataDirectory["goal"]
                weekGoalLabel.text = weekGoal
                
            }
            if dataDirectory.keys.contains("spend"){
                currentSpend = dataDirectory["spend"]
                weekSpend.text = currentSpend
            }
        
        }
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
      
        
        
        weekGoalLabel.delegate = self
        monthGoalLabel.delegate = self
        category1Label.delegate = self
        category2Label.delegate = self
        category3Label.delegate = self
        category1AmmountLabel.delegate = self
        category2AmmountLabel.delegate = self
        category3AmmountLabel.delegate = self
        
        monthSpend.text = weekSpend.text
        monthGoalLabel.text = String(Int(weekGoalLabel.text!)! * 4)

        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        
        data.setValue(weekGoalLabel.text, forKey: "goal")
        data.setValue(weekSpend.text, forKey: "spend")
        
       data.write(toFile: filePath!, atomically: true)
        
        
    }
    
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


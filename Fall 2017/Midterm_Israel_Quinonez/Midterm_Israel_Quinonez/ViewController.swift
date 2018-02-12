//
//  ViewController.swift
//  Midterm_Israel_Quinonez
//
//  Created by Israel Quinonez on 10/19/17.
//  Copyright © 2017 Israel Quinonez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var commuteMiles: UITextField!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var gas: UILabel!
    @IBOutlet weak var monthlySwitch: UISwitch!
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var transportationOutlet: UISegmentedControl!
    
    
    var commuteTime: String?
    var gasNeeded: String?
    
   
    func updatetransportation(){
        if transportationOutlet.selectedSegmentIndex == 0 {
            
            let miles = Float(commuteMiles.text!)
            let timeinMinutes = (miles! / 20) * 60
            time.text = String(timeinMinutes)
            
            let gasInGallons = miles! / 24.0
            gas.text = String(gasInGallons)
            mainImage.image = #imageLiteral(resourceName: "CarImage")
        }
        
        if transportationOutlet.selectedSegmentIndex == 1{
            
            let miles = Float(commuteMiles.text!)
            let timeinMinutes = (miles! / 10) * 60
            time.text = String(timeinMinutes)
            
            gas.text = "0.0"
            
            mainImage.image = #imageLiteral(resourceName: "BikeImage")
        
        
        }
        
        if transportationOutlet.selectedSegmentIndex == 2{
            
            let miles = Float(commuteMiles.text!)
            let timeinMinutes = ((miles! / 12) * 60 ) + 10
            time.text = String(timeinMinutes)
            
            gas.text = "0.0"
            
            mainImage.image = #imageLiteral(resourceName: "BusImage")
        
        
        }
        
    
    
    }
    
    func updateMonthly(){
        if monthlySwitch.isOn{
        if time.text != ""{
            time.text = String(Float(time.text!)! * 20)
        }
        
        if gas.text != ""{
            gas.text = String(Float(gas.text!)! * 20)
        }
        }
        else{
            updatetransportation()
        }
       
    
    }
    
    
   
    @IBAction func transportationAction(_ sender: UISegmentedControl) {
      
        updatetransportation()
        updateMonthly()
        
      
    }
    
    
    @IBAction func toggleMonthly(_ sender: UISwitch) {
       updateMonthly()
    
    }
    
    
    
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
      
        updatetransportation()
        updateMonthly()
    
    }
    
    
    
    
    override func viewDidLoad() {
       commuteMiles.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if Double(commuteMiles.text!)! > 50.0{
            
            let alert=UIAlertController(title: "Warning", message: "Your commute is over 50 miles!, consider taking the bus or riding the bike!", preferredStyle: UIAlertControllerStyle.alert)

            let dismissAction = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(dismissAction)
            
            present(alert, animated: true, completion: nil)
        
        }
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


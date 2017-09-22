//
//  ViewController.swift
//  Lab2_Israel_Quinonez
//
//  Created by Israel Quinonez on 9/21/17.
//  Copyright © 2017 Israel Quinonez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cardImage: UIImageView!
    
    @IBOutlet weak var cardText: UILabel!
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    @IBOutlet weak var capitalSwitch: UISwitch!
   
    @IBOutlet weak var fontSizeLabel: UISlider!
    
    @IBOutlet weak var colorSwitch: UISegmentedControl!
   
    
    
    
    func updateImage(){
        
        if imageControl.selectedSegmentIndex==0{
            cardText.text="Happy Birthday!"
            cardImage.image = #imageLiteral(resourceName: "birthdayImage")
        }
        else if imageControl.selectedSegmentIndex==1{
            cardText.text = "Thank You!"
            cardImage.image = #imageLiteral(resourceName: "thankyouImage")
        }
        else if imageControl.selectedSegmentIndex==2{
            cardText.text = "Marry Christmas!"
            cardImage.image = #imageLiteral(resourceName: "christmasImage")
        }
    }
    
    func updateCaps(){
        if capitalSwitch.isOn{
            cardText.text = cardText.text?.uppercased()
        }
        else{
            cardText.text = cardText.text?.lowercased()
        }
        
    }
    
    

    
    
    
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    
    }
    
    
    @IBAction func updateCapital(_ sender: UISwitch) {
      updateCaps()
    }
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        if colorSwitch.selectedSegmentIndex==0{
            cardText.textColor=UIColor.black
        }
        else if colorSwitch.selectedSegmentIndex==1{
            cardText.textColor=UIColor.red
        }
        else if colorSwitch.selectedSegmentIndex==2{
            cardText.textColor=UIColor.blue
        }
    
    
    }
    
   
    
    
    
    
    
    
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize=sender.value
        let fontSizeCGFloat = CGFloat(fontSize)
        cardText.font = UIFont.systemFont(ofSize: fontSizeCGFloat)
        
    
    }
    
    
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


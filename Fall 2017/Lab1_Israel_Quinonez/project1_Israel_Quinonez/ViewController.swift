//
//  ViewController.swift
//  project1_Israel_Quinonez
//
//  Created by Israel Quinonez on 9/13/17.
//  Copyright © 2017 Israel Quinonez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appTitle: UILabel!
    
    @IBOutlet weak var contentTitle: UILabel!
    
    @IBOutlet weak var bodyText: UITextView!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    
    @IBAction func pressButton(_ sender: UIButton) {
    
        if sender.tag == 1{
            contentTitle.text = "Anatomy"
            bodyText.text = "Hippos are on average 11ft in legth, 5ft tall. They weigh over three thousand pounds once in full adulthood. A hippos mouth can open to over 4ft wide. Hippos also excrete a red oily sweat from their skin often called blood sweat that acts as a natural moisturizer"
            mainImage.image = #imageLiteral(resourceName: "AnatomyHippo")
        }
        
        else if sender.tag == 2 {
            contentTitle.text = "Overview"
            bodyText.text = "The Hippopotamus is one of the most interesting animals in the world. The 3rd largest land animal, an average adult hippo weighs over three thousand pounds. Hippos are considered one of the most dangreous animals in the world despite their cute fat look."
            mainImage.image = #imageLiteral(resourceName: "OverviewHippo")
        
        }
        else if sender.tag == 3 {
            contentTitle.text = "Environment"
            bodyText.text = " Hippos live in sub-saharan Africa, but because they need water they can be found by rivers and lakes. They spend an average of 16 hours of the day in water and seek food at night"
            mainImage.image = #imageLiteral(resourceName: "EnvironmentHippo")
        }
    
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


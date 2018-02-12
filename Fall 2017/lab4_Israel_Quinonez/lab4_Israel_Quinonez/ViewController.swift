//
//  ViewController.swift
//  lab4_Israel_Quinonez
//
//  Created by Israel Quinonez on 10/18/17.
//  Copyright © 2017 Israel Quinonez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var item1Label: UILabel!
    @IBOutlet weak var item2Label: UILabel!
    @IBOutlet weak var item3Label: UILabel!
    @IBOutlet weak var item4Label: UILabel!
   
    var user = Items()
    
    let filename = "list.plist"
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
       if item1Label.text == ""{
        item1Label.text = user.item
        }
       else if item2Label.text == ""{
            item2Label.text = user.item
        }
       else if item3Label.text == ""{
            item3Label.text = user.item
        }
       else if item4Label.text == ""{
            item4Label.text = user.item
        }
    }
    
    func docFilePath(_ filename: String) -> String?{
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        let dir = path[0] as NSString
        
        return dir.appendingPathComponent(filename)
    }
    
    
    
    override func viewDidLoad() {
        let filePath = docFilePath(filename)
        
        if FileManager.default.fileExists(atPath: filePath!){
            let path = filePath
            
            let dataDictionary = NSDictionary(contentsOfFile: path!) as! [String:String]
            
            if dataDictionary.keys.contains("1"){
                
                item1Label.text = dataDictionary["1"]
            }
            
            if dataDictionary.keys.contains("2"){
                item2Label.text = dataDictionary["2"]
            }
            
            if dataDictionary.keys.contains("3"){
                item3Label.text = dataDictionary["3"]
            }
            
            if dataDictionary.keys.contains("4"){
                item4Label.text = dataDictionary["4"]
            }
        
        }
        
        let app = UIApplication.shared
        
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        
        if item1Label.text != ""{
            data.setValue(item1Label.text, forKey: "1")
        }
        
        if item2Label.text != ""{
            data.setValue(item2Label.text, forKey: "2")
        }
        
        if item3Label.text != ""{
            data.setValue(item3Label.text, forKey: "3")
        }
        
        if item4Label.text != ""{
            data.setValue(item4Label.text, forKey: "4")
        }
        
        data.write(toFile: filePath!, atomically: true)
    
    }
    
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


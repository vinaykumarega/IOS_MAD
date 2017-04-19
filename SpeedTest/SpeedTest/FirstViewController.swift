//
//  FirstViewController.swift
//  SpeedTest
//
//  Created by sce on 4/18/17.
//  Copyright © 2017 uhcl.edu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var Displayword: UILabel!
    
    @IBOutlet weak var wpmSpeed: UITextField!
    
    @IBAction func starttest(_ sender: UIButton) {
        
        let location  = "/Users/sce/Documents/Developer_MAD/SpeedTest/SpeedTest/textfile.txt"
        var fileContent: NSString = ""
        do { try  fileContent = NSString(contentsOfFile: location, encoding: String.Encoding.utf8.rawValue)
        }
    
    catch is NSError  {
        print("Invalid file")

        }
        
        var stringarry = [String]()
        stringarry = fileContent.components(separatedBy: " ")
        Displayword.text! = stringarry[0]
        var wpm: Int = Int(wpmSpeed.text!)!
        
        
        
       
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


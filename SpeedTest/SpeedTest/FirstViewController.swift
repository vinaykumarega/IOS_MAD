//
//  FirstViewController.swift
//  SpeedTest
//
//  Created by sce on 4/18/17.
//  Copyright © 2017 uhcl.edu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var timer1 : Timer!
    
    var stringarry = [String]()
    var randm: Int = 0
    
    @IBOutlet weak var SecondView: UIView!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBAction func firstViewSubmitButton(_ sender: Any) {
        
        firstView.isHidden = true
        SecondView.isHidden = false
        
    }
    @IBOutlet weak var pausevisible: UIButton!
    
    @IBAction func pausebutton(_ sender: UIButton) {
        
        timer1.invalidate()
        
    }
    @IBOutlet weak var Displayword: UILabel!
    
    @IBOutlet weak var wpmSpeed: UITextField!
    
    @IBAction func starttest(_ sender: UIButton) {
        
        pausevisible.isHidden = false
        
        var wpm: Double = 0
        
        wpm = Double(wpmSpeed.text!)!
        
        var timeintrval: TimeInterval = (60 / wpm)
        
        timer1 = Timer.scheduledTimer(timeInterval: timeintrval, target: self, selector:#selector(timerAction), userInfo: nil, repeats: true)
        
        let location  = "/Users/sce/Documents/Developer_MAD/SpeedTest/SpeedTest/textfile.txt"
        
        var fileContent: NSString = ""
        
        do { try  fileContent = NSString(contentsOfFile: location, encoding: String.Encoding.utf8.rawValue)
        }
    
        catch is NSError  {
            
        print("Invalid file")

        }
        stringarry = fileContent.components(separatedBy: " ")
        timer1.fire()
        
        //Displayword.text! = stringarry[0]
        
       
    }
    func timerAction(){
        
       randm = stringarry.count
        
        Displayword.text! = stringarry[Int(arc4random_uniform(UInt32(randm)))]
        
        
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        pausevisible.isHidden = true
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


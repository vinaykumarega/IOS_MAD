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
    var userDataModel = userDBModel()
    
    var stringarry = [String]()
    var randm: Int = 0
    
    @IBOutlet weak var DisplayName: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SecondView: UIView!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBAction func nameSubmitButton(_ sender: Any) {
        
     var i = 0
     var addme = 0
        
    unarchive()
        
    var lastuser = userDataModel.userdetails.count
        
        
        for i in 0...userDataModel.userdetails.count{
        
            if userDataModel.userdetails[i].username == nameField.text!{
            
            addme = 0
            
            }
            else {
            
            addme = 1
            }
        }

        if addme == 1{
        
        userDataModel.userdetails[lastuser + 1].username = nameField.text!
        archive()
        
        }
        firstView.isHidden = true
        SecondView.isHidden = false
        DisplayName.text! = nameField.text!
        
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
        
        unarchive()
        var i = 0
        
        for i in 1...userDataModel.userdetails.count{
        
            if userDataModel.userdetails[i].username == nameField.text!{
            
            break
            
            }
        
        }
        userDataModel.userdetails[i].userSpeed.append(Int(wpmSpeed.text!)!)
        archive()
        
        
    }
    
    func archive(){
    
        let userdatapath = NSHomeDirectory() + "Documents/userData.archive"
        print(userdatapath)
        NSKeyedArchiver.archiveRootObject(userDataModel.userdetails, toFile: userdatapath)
        
    }
    
    func unarchive(){
    
        let userdatapath = NSHomeDirectory() + "Documents/userData.archive"
        let manager = FileManager.default
        if manager.fileExists(atPath: userdatapath){
        
          userDataModel.userdetails = NSKeyedUnarchiver.unarchiveObject(withFile: userdatapath) as! [UserNameSpeed]
        }
    
    }
    
    func timerAction(){
        
       randm = stringarry.count
        
        Displayword.text! = stringarry[Int(arc4random_uniform(UInt32(randm)))]
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        pausevisible.isHidden = true
        SecondView.isHidden = true
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


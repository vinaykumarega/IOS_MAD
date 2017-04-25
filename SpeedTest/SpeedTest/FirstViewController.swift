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
    var uname: String = ""
    var uspeed = [Int]()
    var stringarry = [String]()
    var randm: Int = 0
    
    @IBOutlet weak var DisplayName: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SecondView: UIView!
    
    @IBOutlet weak var firstView: UIView!
    
    
    @IBAction func nameSubmitButton(_ sender: UIButton) {
        
        
        firstView.isHidden = true
        SecondView.isHidden = false
        DisplayName.text! = nameField.text!
        print("submit pressed")
        }
    
    
   
    @IBOutlet weak var pausevisible: UIButton!
    
    @IBAction func pausebutton(_ sender: UIButton) {
        
        timer1.invalidate()
        print(userDataModel.userdetails)
    }
    @IBOutlet weak var Displayword: UILabel!
    
    @IBOutlet weak var wpmSpeed: UITextField!
    
    @IBAction func starttest(_ sender: UIButton) {
        
        var userelement = UserNameSpeed(username: uname, userSpeed: uspeed)
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
        
        
        var i1 = 0
        var addme = 0
        
        var creatfile = 0
        creatfile = unarchive1()
        if creatfile == 1{
            
            userelement.username = DisplayName.text!
            userelement.userSpeed.append(Int(wpmSpeed.text!)!)
            userDataModel.userdetails.append(userelement)
            
            archive()
            
        }
        unarchive()
        
        userelement.username = DisplayName.text!
        userelement.userSpeed.append(Int(wpmSpeed.text!)!)
        print(userDataModel.userdetails.count)
        var lastuser = userDataModel.userdetails.count
        
        if lastuser >= 2 {
            
        
        for i1 in 0...lastuser-1{
            
            if userDataModel.userdetails[i1].username == nameField.text!{
                
                addme = 0
                
            }
            else {
                
                addme = 1
            }
        }
        
        if addme == 1{
            
            userDataModel.userdetails.append(userelement)
            archive()
            
        }

    }
    }
    
    @IBAction func gobackButton(_ sender: UIButton) {
        
        SecondView.isHidden = true
        firstView.isHidden = false
        
        
    }
    func archive(){
    
        let userdatapath = NSHomeDirectory() + "Documents/userData.archive"
        print(userdatapath + "/n archiving")
        NSKeyedArchiver.archiveRootObject(userDataModel.userdetails, toFile: userdatapath)
        sync()
        
    }
    
    func unarchive1() -> Int {
    
        let userdatapath = NSHomeDirectory() + "Documents/userData.archive"
        let manager = FileManager.default
        if manager.fileExists(atPath: userdatapath){
        
          userDataModel.userdetails = NSKeyedUnarchiver.unarchiveObject(withFile: userdatapath) as! [UserNameSpeed]
              return 0
        }
        else
        {
            print("File not Found")
            return 1
        }
      
    
    }
    func unarchive() {
        
        let userdatapath = NSHomeDirectory() + "Documents/userData.archive"
        let manager = FileManager.default
        if manager.fileExists(atPath: userdatapath){
            
            userDataModel.userdetails = NSKeyedUnarchiver.unarchiveObject(withFile: userdatapath) as! [UserNameSpeed]
            print("\(userDataModel.userdetails)")
        }
        
    }
    func timerAction(){
        
       randm = stringarry.count
        
        Displayword.text! = stringarry[Int(arc4random_uniform(UInt32(randm)))]
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //pausevisible.isHidden = true
        SecondView.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


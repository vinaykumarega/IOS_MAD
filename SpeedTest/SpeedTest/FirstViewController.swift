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
    var index = 0
    
    
    @IBOutlet weak var DisplayName: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SecondView: UIView!
    
    @IBOutlet weak var firstView: UIView!
    
    
    @IBAction func nameSubmitButton(_ sender: UIButton) {
        
        var i2: Int
        var j = userDataModel.userdetails.count
        firstView.isHidden = true
        SecondView.isHidden = false
        DisplayName.text! = nameField.text!
        print("submit pressed")
        
         let tbc1 = tabBarController as! mycustomtabcontrollerViewController
            tbc1.usernme = DisplayName.text! }
        
        
    
    
   
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
        var delaytime: Int
        
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
        
       
        
        
        var i1 = 0
        var index = 0
        var addme = 0
        var createfile = 0
        userelement.username = DisplayName.text!
        userelement.userSpeed.append(Int(wpmSpeed.text!)!)
    
        createfile = unarchive1()
        if createfile == 1{
            
            
            userDataModel.userdetails.append(userelement)
            
            archive()
            
        }
        else{
        unarchive()
        
        
        var lastuser = userDataModel.userdetails.count
        
        
            
            if lastuser >= 1{
        for i1 in 0...lastuser-1 {
            
            if userDataModel.userdetails[i1].username == DisplayName.text!{
                
                addme = 0
                index = i1
                break
                
            }
            else {
                
                addme = 1
            }
        }
            }
            else{
            
                addme = 1
            
            }
        if addme == 1{
            
            userDataModel.userdetails.append(userelement)
            archive()
            
            
        }
        else{
            
            userDataModel.userdetails[index].userSpeed.append(Int(wpmSpeed.text!)!)
            archive()
            
            }
            
            
    
        }
       var lastuser = userDataModel.userdetails.count
        if lastuser >= 1{
        for i1 in 0...lastuser-1{
        
            print("\(userDataModel.userdetails[i1].username)")
            print( "\(userDataModel.userdetails[i1].userSpeed)")
            print("\(userDataModel.userdetails[i1].defaultSpeed)")
            print("\(userDataModel.userdetails[i1].delay)")
        
        }
        }
        else{
        
            print("some error in saving")
        
        }
        
         timer1.fire()
    }
    
    @IBAction func gobackButton(_ sender: UIButton) {
        
        SecondView.isHidden = true
        firstView.isHidden = false
        
        
    }
    func findindex(){
        
        var lastuser = userDataModel.userdetails.count
        
        if lastuser >= 1 {
            for i1 in 0...lastuser-1 {
                
                if userDataModel.userdetails[i1].username == DisplayName.text! {
                    
                    
                    index = i1
                    break
                    
                }
                
                
            }
            
        }
        else{
            
            index = 0
            
        }
    }
    func archive(){
    
        let userdatapath = NSHomeDirectory() + "/Documents/userData1.archive"
        print(userdatapath)
    
        NSKeyedArchiver.archiveRootObject(userDataModel.userdetails, toFile: userdatapath)
        
        
    }
    
    func unarchive1() -> Int {
    
        let userdatapath = NSHomeDirectory() + "/Documents/userData1.archive"
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
        
        let userdatapath = NSHomeDirectory() + "/Documents/userData1.archive"
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
    
    func unarchive(_ notification:Notification) {
        print("Unarchiving")
        let path = NSHomeDirectory() + "/Documents/userData1.archive"
        let manager = FileManager.default
        if manager.fileExists(atPath: path) {
            userDataModel.userdetails = NSKeyedUnarchiver.unarchiveObject(withFile: path)
                as! [UserNameSpeed]
        }
        
    }
    
    func archive(_ notification: Notification) {
        print("Archiving")
        let path = NSHomeDirectory() + "/Documents/userData1.archive"
        NSKeyedArchiver.archiveRootObject(userDataModel.userdetails,
                                          toFile: path)
    }


    override func viewDidLoad() {
        
        super.viewDidLoad()
        //pausevisible.isHidden = true
        SecondView.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.archive(_:)), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.unarchive(_:)), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        findindex()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        archive()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


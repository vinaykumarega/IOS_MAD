//
//  ThirdViewController.swift
//  SpeedTest
//
//  Created by sce on 4/27/17.
//  Copyright © 2017 uhcl.edu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var userName: String = ""
    
    var userDataModel = userDBModel()
    var index: Int = 0
    
    @IBOutlet weak var displyname: UILabel!
    @IBOutlet weak var defaultspd: UITextField!
    
    
    @IBOutlet weak var delay1: UITextField!
    
    
    
    @IBAction func setMethod(_ sender: Any) {
        userDataModel.userdetails[index].defaultSpeed = Int32(defaultspd.text!)!
        userDataModel.userdetails[index].delay = Int32(delay1.text!)!
        archive()
        
        print("After value changed")
        print("\(userDataModel.userdetails[index].defaultSpeed)")
        print("\(userDataModel.userdetails[index].delay)")

        
    }
    
    func retrieve(){
    
    unarchive()
        
        findindex()
        
        print("Before value changed")
        print("\(userDataModel.userdetails[index].defaultSpeed)")
        print("\(userDataModel.userdetails[index].delay)")

        
        defaultspd.text! = "\(userDataModel.userdetails[index].defaultSpeed)"

        delay1.text! = "\(userDataModel.userdetails[index].delay)"
        
        
    }
    
    func findindex(){
    
        var lastuser = userDataModel.userdetails.count
        
        if lastuser >= 1 {
        for i1 in 0...lastuser-1 {
            
            if userDataModel.userdetails[i1].username == userName {
                
                
                index = i1
                break
                
            }
            
    
    }
            
    }
        else{
        
            index = 0
        
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
    
    func archive(){
        
        let userdatapath = NSHomeDirectory() + "/Documents/userData1.archive"
        print(userdatapath)
        
        NSKeyedArchiver.archiveRootObject(userDataModel.userdetails, toFile: userdatapath)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tbc1 = tabBarController as! mycustomtabcontrollerViewController
        userName = tbc1.usernme
        displyname.text! = userName
        retrieve()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


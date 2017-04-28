//
//  SecondViewController.swift
//  SpeedTest
//
//  Created by sce on 4/18/17.
//  Copyright © 2017 uhcl.edu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var userName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let tbc1 = tabBarController as! mycustomtabcontrollerViewController
        userName = tbc1.usernme
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


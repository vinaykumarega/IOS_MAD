//
//  UserNameSpeed.swift
//  SpeedTest
//
//  Created by sce on 4/23/17.
//  Copyright © 2017 uhcl.edu. All rights reserved.
//

import Foundation

class UserNameSpeed: NSObject, NSCoding{


    var username:String
    var userSpeed = [Int]()
    var defaultSpeed = 100
    var delay = 2
   
    func encode(with aCoder: NSCoder) {
        aCoder.encode(username, forKey: "username1")
        aCoder.encode(userSpeed, forKey: "userspeeds")
        aCoder.encode(defaultSpeed, forKey: "DefaultSpeed")
        aCoder.encode(delay, forKey: "Delay")

    }
    
    required init?(coder aDecoder: NSCoder) {
        username = aDecoder.decodeObject(forKey: "username1") as! String
        userSpeed = aDecoder.decodeObject(forKey: "userspeeds") as! [Int]
        defaultSpeed = aDecoder.decodeObject(forKey: "DefaultSpeed") as! Int
        delay = aDecoder.decodeObject(forKey:"Delay") as! Int
        
    }
    
    init(username: String, userSpeed: [Int])
    {
        self.username = username
        self.userSpeed = userSpeed
        
    }
    
}

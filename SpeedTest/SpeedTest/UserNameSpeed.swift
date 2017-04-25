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
   
    func encode(with aCoder: NSCoder) {
        aCoder.encode(username, forKey: "username1")
        aCoder.encode(userSpeed, forKey: "userspeeds")

    }
    
    required init?(coder aDecoder: NSCoder) {
        username = aDecoder.decodeObject(forKey: "username1") as! String
        userSpeed = aDecoder.decodeObject(forKey: "userspeeds") as! [Int]
        
    }
    
    init(username: String, userSpeed: [Int])
    {
        self.username = username
        self.userSpeed = userSpeed
        
    }
    
}

//
//  User.swift
//  Music-iOS
//
//  
//

import Foundation
import RealmSwift

class User : Object {
    dynamic var id = ""
    dynamic var name = ""
    dynamic var picture = ""
    var friends = List<User>()
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

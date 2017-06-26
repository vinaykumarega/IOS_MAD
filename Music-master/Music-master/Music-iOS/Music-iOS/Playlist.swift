//
//  Playlist.swift
//  Music-iOS
//
//  
//

import Foundation
import RealmSwift

class Playlist: Object {
    dynamic var name = ""
    dynamic var id = 0
    var songs = List<Song>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

//  Film+Realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Foundation
import RealmSwift

extension Film {
  
  static func findAll() -> Results<Film> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(Film.self)
  }
  
  static func findFirst(withKey key: String) -> Film? {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    return realm.object(ofType: Film.self, forPrimaryKey: key)
  }
}

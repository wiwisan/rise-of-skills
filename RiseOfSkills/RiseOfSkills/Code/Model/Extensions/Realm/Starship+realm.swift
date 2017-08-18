//
//  Starship+realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import Foundation
import RealmSwift

extension Starship {
  
  static func findAll() -> Results<Starship> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(Starship.self)
  }
  
  static func findFirst(withKey key: String) -> Starship? {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    return realm.object(ofType: Starship.self, forPrimaryKey: key)
  }
}

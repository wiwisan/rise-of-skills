//
//  Species+Realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import Foundation
import RealmSwift

extension Species {
  
  static func findAll() -> Results<Species> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(Species.self)
  }
  
  static func findFirst(withKey key: String) -> Species? {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    return realm.object(ofType: Species.self, forPrimaryKey: key)
  }
}

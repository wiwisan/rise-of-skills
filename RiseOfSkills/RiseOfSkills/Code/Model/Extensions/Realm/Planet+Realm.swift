//
//  Planet+Realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import Foundation
import RealmSwift

extension Planet {
  
  static func findAll() -> Results<Planet> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(Planet.self)
  }
  
  static func findFirst(withKey key: String) -> Planet? {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    return realm.object(ofType: Planet.self, forPrimaryKey: key)
  }
}

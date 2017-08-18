//
//  Vehicle+realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import Foundation
import RealmSwift

extension Vehicle {
  
  static func findAll() -> Results<Vehicle> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(Vehicle.self)
  }
  
  static func findFirst(withKey key: String) -> Vehicle? {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    return realm.object(ofType: Vehicle.self, forPrimaryKey: key)
  }
}

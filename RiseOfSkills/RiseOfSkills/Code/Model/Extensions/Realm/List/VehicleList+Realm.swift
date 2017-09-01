//
//  VehicleList+Realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import RealmSwift

extension VehicleList {
  
  static func findAll() -> Results<VehicleList> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(VehicleList.self)
  }
}

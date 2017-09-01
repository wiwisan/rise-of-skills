//
//  VehicleList.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import RealmSwift

final class VehicleList: Object {
  
  dynamic var id                   = UUID().uuidString
  dynamic var count                = 0
  dynamic var next: String?        = nil
  dynamic var previous: String?    = nil
  let results                      = List<Vehicle>()
  
  override static func primaryKey() -> String? {
    return "id"
  }
}

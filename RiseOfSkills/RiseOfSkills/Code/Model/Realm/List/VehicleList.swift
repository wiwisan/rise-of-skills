//
//  VehicleList.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import RealmSwift

final class VehicleList: Object {
  
  dynamic var count     = 0
  dynamic var next      = ""
  dynamic var previous  = ""
  let results           = List<Vehicle>()
}

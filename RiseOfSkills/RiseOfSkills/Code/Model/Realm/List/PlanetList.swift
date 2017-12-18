//
//  PlanetList.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import RealmSwift

final class PlanetList: Object {
  
  @objc dynamic var id                   = UUID().uuidString
  @objc dynamic var count                = 0
  @objc dynamic var next: String?        = nil
  @objc dynamic var previous: String?    = nil
  let results                      = List<Planet>()
  
  override static func primaryKey() -> String? {
    return "id"
  }
}

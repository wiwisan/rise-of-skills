//
//  PlanetList+realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import RealmSwift

extension PlanetList {
  
  static func findAll() -> Results<PlanetList> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(PlanetList.self)
  }
}

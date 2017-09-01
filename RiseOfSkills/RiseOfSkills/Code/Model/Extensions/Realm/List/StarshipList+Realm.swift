//
//  StarshipList+realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import RealmSwift

extension StarshipList {
  
  static func findAll() -> Results<StarshipList> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(StarshipList.self)
  }
}

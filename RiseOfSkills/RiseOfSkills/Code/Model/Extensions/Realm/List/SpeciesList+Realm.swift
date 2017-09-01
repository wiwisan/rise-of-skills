//
//  SpeciesList+Realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import RealmSwift

extension SpeciesList {
  
  static func findAll() -> Results<SpeciesList> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(SpeciesList.self)
  }
}

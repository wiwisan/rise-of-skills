//
//  CharacterList+Realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import RealmSwift

extension CharacterList {
  
  static func findAll() -> Results<CharacterList> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(CharacterList.self)
  }
}

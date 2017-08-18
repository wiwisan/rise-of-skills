//
//  Character+Realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import Foundation
import RealmSwift

extension Character {
  
  static func findAll() -> Results<Character> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(Character.self)
  }
  
  static func findFirst(withKey key: String) -> Character? {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    return realm.object(ofType: Character.self, forPrimaryKey: key)
  }
}

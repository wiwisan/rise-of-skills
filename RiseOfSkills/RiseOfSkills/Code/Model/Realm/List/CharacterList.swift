//
//  CharacterList.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import RealmSwift

final class CharacterList: Object {
  
  @objc dynamic var id                   = UUID().uuidString
  @objc dynamic var count                = 0
  @objc dynamic var next: String?        = nil
  @objc dynamic var previous: String?    = nil
  let results                      = List<Character>()
  
  override static func primaryKey() -> String? {
    return "id"
  }
}

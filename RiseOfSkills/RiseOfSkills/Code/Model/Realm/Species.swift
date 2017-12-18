//  Species.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import RealmSwift

final class Species: Object {
  
  convenience init(url: String) {
    self.init()
    
    self.url = url
  }

  @objc dynamic var name            = ""
  @objc dynamic var classification  = ""
  @objc dynamic var designation     = ""
  @objc dynamic var averageHeight   = ""
  @objc dynamic var averageLifespan = ""
  @objc dynamic var eyeColors       = ""
  @objc dynamic var hairColors      = ""
  @objc dynamic var skinColors      = ""
  @objc dynamic var language        = ""
  @objc dynamic var homeworld       = ""
  @objc dynamic var url             = ""
  @objc dynamic var created         = ""
  @objc dynamic var edited          = ""
  let people                  = List<Character>()
  let films                   = List<Film>()
  
  override static func primaryKey() -> String? {
    return "url"
  }
}

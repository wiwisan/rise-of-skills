//  Character.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import RealmSwift

final class Character: Object {

  convenience init(url: String) {
    self.init()
    
    self.url = url
  }
  
  @objc dynamic var name          = ""
  @objc dynamic var birthYear     = ""
  @objc dynamic var eyeColor      = ""
  @objc dynamic var gender        = ""
  @objc dynamic var hairColor     = ""
  @objc dynamic var height        = ""
  @objc dynamic var mass          = ""
  @objc dynamic var skinColor     = ""
  @objc dynamic var homeworld     = ""
  @objc dynamic var url           = ""
  @objc dynamic var created       = ""
  @objc dynamic var edited        = ""
  let species               = List<Species>()
  let vehicles              = List<Vehicle>()
  let films                 = List<Film>()
  let starships             = List<Starship>()
  
  override static func primaryKey() -> String? {
    return "url"
  }
}

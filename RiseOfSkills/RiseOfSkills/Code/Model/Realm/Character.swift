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
  
  dynamic var name          = ""
  dynamic var birthYear     = ""
  dynamic var eyeColor      = ""
  dynamic var gender        = ""
  dynamic var hairColor     = ""
  dynamic var height        = ""
  dynamic var mass          = ""
  dynamic var skinColor     = ""
  dynamic var homeworld     = ""
  dynamic var url           = ""
  dynamic var created       = ""
  dynamic var edited        = ""
  let species               = List<Species>()
  let vehicles              = List<Vehicle>()
  let films                 = List<Film>()
  let starships             = List<Starship>()
  
  override static func primaryKey() -> String? {
    return "url"
  }
}

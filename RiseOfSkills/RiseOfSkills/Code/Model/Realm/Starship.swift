//  Starship.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import RealmSwift

final class Starship: Object {
  
  convenience init(url: String) {
    self.init()
    
    self.url = url
  }

  @objc dynamic var name                 = ""
  @objc dynamic var model                = ""
  @objc dynamic var starshipClass        = ""
  @objc dynamic var manufacturer         = ""
  @objc dynamic var costInCredits        = ""
  @objc dynamic var length               = ""
  @objc dynamic var crew                 = ""
  @objc dynamic var passengers           = ""
  @objc dynamic var maxAtmospheringSpeed = ""
  @objc dynamic var hyperdriveRating     = ""
  @objc dynamic var MGLT                 = ""
  @objc dynamic var cargoCapacity        = ""
  @objc dynamic var consumables          = ""
  @objc dynamic var url                  = ""
  @objc dynamic var created              = ""
  @objc dynamic var edited               = ""
  let films                        = List<Film>()
  let pilots                       = List<Character>()
  
  override static func primaryKey() -> String? {
    return "url"
  }
}

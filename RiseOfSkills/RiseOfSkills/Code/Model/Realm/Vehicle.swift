//  Vehicle.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import RealmSwift

final class Vehicle: Object {
  
  convenience init(url: String) {
    self.init()
    
    self.url = url
  }

  @objc dynamic var name                 = ""
  @objc dynamic var model                = ""
  @objc dynamic var vehicleClass         = ""
  @objc dynamic var manufacturer         = ""
  @objc dynamic var length               = ""
  @objc dynamic var costInCredits        = ""
  @objc dynamic var crew                 = ""
  @objc dynamic var passengers           = ""
  @objc dynamic var maxAtmospheringSpeed = ""
  @objc dynamic var cargoCapacity        = ""
  @objc dynamic var consumables          = ""
  @objc dynamic var url                  = ""
  @objc  dynamic var created              = ""
  @objc dynamic var edited               = ""
  let films                        = List<Film>()
  let pilots                       = List<Character>()
  
  override static func primaryKey() -> String? {
    return "url"
  }
}

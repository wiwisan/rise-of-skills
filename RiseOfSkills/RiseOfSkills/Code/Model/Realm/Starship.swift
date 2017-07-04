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

  dynamic var name                 = ""
  dynamic var model                = ""
  dynamic var starshipClass        = ""
  dynamic var manufacturer         = ""
  dynamic var costInCredits        = ""
  dynamic var length               = ""
  dynamic var crew                 = ""
  dynamic var passengers           = ""
  dynamic var maxAtmospheringSpeed = ""
  dynamic var hyperdriveRating     = ""
  dynamic var MGLT                 = ""
  dynamic var cargoCapacity        = ""
  dynamic var consumables          = ""
  dynamic var url                  = ""
  dynamic var created              = ""
  dynamic var edited               = ""
  let films                        = List<Film>()
  let pilots                       = List<Character>()
}

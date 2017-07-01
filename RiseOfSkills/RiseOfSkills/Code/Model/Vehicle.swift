//  Vehicle.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import RealmSwift

final class Vehicle: Object {

  dynamic var name                 = ""
  dynamic var model                = ""
  dynamic var vehicleClass         = ""
  dynamic var manufacturer         = ""
  dynamic var length               = ""
  dynamic var costInCredits        = ""
  dynamic var crew                 = ""
  dynamic var passengers           = ""
  dynamic var maxAtmospheringSpeed = ""
  dynamic var cargoCapacity        = ""
  dynamic var consumables          = ""
  dynamic var url                  = ""
  dynamic var created              = ""
  dynamic var edited               = ""
  let films                        = List<Film>()
  let pilots                       = List<Character>()
}

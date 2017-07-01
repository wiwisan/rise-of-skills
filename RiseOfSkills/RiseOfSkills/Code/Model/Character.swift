//  Character.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import RealmSwift

final class Character: Object {

  dynamic var name      = ""
  dynamic var birthYear = ""
  dynamic var eyeColor  = ""
  dynamic var gender    = ""
  dynamic var hairColor = ""
  dynamic var height    = ""
  dynamic var mass      = ""
  dynamic var skinColor = ""
  dynamic var homeworld = ""
  let films             = List<Film>()
  dynamic var species   = ""
  dynamic var starships = ""
  dynamic var vehicles  = ""
  dynamic var url       = ""
  dynamic var created   = ""
  dynamic var edited    = ""
}

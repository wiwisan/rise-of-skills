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
  dynamic var url       = ""
  dynamic var created   = ""
  dynamic var edited    = ""
  let species           = List<RealmString>()
  let vehicles          = List<RealmString>()
  let films             = List<RealmString>()
  let starships         = List<RealmString>()
}

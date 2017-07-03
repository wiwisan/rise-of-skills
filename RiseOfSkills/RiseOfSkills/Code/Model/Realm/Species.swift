//  Species.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import RealmSwift

final class Species: Object {

  dynamic var name            = ""
  dynamic var classification  = ""
  dynamic var designation     = ""
  dynamic var averageHeight   = ""
  dynamic var averageLifespan = ""
  dynamic var eyeColors       = ""
  dynamic var hairColors      = ""
  dynamic var skinColors      = ""
  dynamic var language        = ""
  dynamic var homeworld       = ""
  dynamic var url             = ""
  dynamic var created         = ""
  dynamic var edited          = ""
  let people                  = List<RealmString>()
  let films                   = List<RealmString>()
}

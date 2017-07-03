//  Planet.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import RealmSwift

final class Planet: Object {

  dynamic var name           = ""
  dynamic var diameter       = ""
  dynamic var rotationPeriod = ""
  dynamic var orbitalPeriod  = ""
  dynamic var gravity        = ""
  dynamic var population     = ""
  dynamic var climate        = ""
  dynamic var terrain        = ""
  dynamic var language       = ""
  dynamic var surfaceWater   = ""
  dynamic var url            = ""
  dynamic var created        = ""
  dynamic var edited         = ""
  let residents              = List<RealmString>()
  let films                  = List<RealmString>()
}

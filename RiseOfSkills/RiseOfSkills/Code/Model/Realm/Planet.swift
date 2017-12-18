//  Planet.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import RealmSwift

final class Planet: Object {
  
  convenience init(url: String) {
    self.init()
    
    self.url = url
  }

  @objc dynamic var name           = ""
  @objc dynamic var diameter       = ""
  @objc dynamic var rotationPeriod = ""
  @objc dynamic var orbitalPeriod  = ""
  @objc dynamic var gravity        = ""
  @objc dynamic var population     = ""
  @objc dynamic var climate        = ""
  @objc dynamic var terrain        = ""
  @objc dynamic var surfaceWater   = ""
  @objc dynamic var url            = ""
  @objc dynamic var created        = ""
  @objc dynamic var edited         = ""
  let residents              = List<Character>()
  let films                  = List<Film>()
  
  override static func primaryKey() -> String? {
    return "url"
  }
}

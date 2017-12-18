//  Film.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import RealmSwift

final class Film: Object {
  
  convenience init(url: String) {
    self.init()
    
    self.url = url
  }

  @objc dynamic var title        = ""
  @objc dynamic var episodeId    = 0
  @objc dynamic var openingCrawl = ""
  @objc dynamic var director     = ""
  @objc dynamic var producer     = ""
  @objc dynamic var releaseDate  = ""
  @objc dynamic var url          = ""
  @objc dynamic var created      = ""
  @objc dynamic var edited       = ""
  var planets              = List<Planet>()
  var species              = List<Species>()
  var vehicles             = List<Vehicle>()
  var starships            = List<Starship>()
  var characters           = List<Character>()
  
  override static func primaryKey() -> String? {
    return "url"
  }
}

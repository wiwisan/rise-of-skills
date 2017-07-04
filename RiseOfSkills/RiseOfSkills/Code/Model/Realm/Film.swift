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

  dynamic var title        = ""
  dynamic var episodeId    = 0
  dynamic var openingCrawl = ""
  dynamic var director     = ""
  dynamic var producer     = ""
  dynamic var releaseDate  = ""
  dynamic var url          = ""
  dynamic var created      = ""
  dynamic var edited       = ""
  var planets              = List<Planet>()
  var species              = List<Species>()
  var vehicles             = List<Vehicle>()
  var starships            = List<Starship>()
  var characters           = List<Character>()
  
  override static func primaryKey() -> String? {
    return "episodeId"
  }
}

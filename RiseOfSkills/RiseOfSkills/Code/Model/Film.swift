//  Film.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import RealmSwift

final class Film: Object {

  dynamic var title        = ""
  dynamic var episodeId    = ""
  dynamic var openingCrawl = ""
  dynamic var director     = ""
  dynamic var producer     = ""
  dynamic var releaseDate  = ""
  dynamic var species      = ""
  dynamic var planets      = ""
  dynamic var url          = ""
  dynamic var created      = ""
  dynamic var edited       = ""
  let vehicles             = List<Vehicle>()
  let starships            = List<Starship>()
  let characters           = List<Character>()
}

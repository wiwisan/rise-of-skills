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
  dynamic var url          = ""
  dynamic var created      = ""
  dynamic var edited       = ""
  var planets              = List<RealmString>()
  var species              = List<RealmString>()
  var vehicles             = List<RealmString>()
  var starships            = List<RealmString>()
  var characters           = List<RealmString>()
}

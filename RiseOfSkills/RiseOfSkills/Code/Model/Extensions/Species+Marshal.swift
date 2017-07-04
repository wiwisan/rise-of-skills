//  Film+Marshal.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Foundation
import RealmSwift
import Marshal

extension Species: Unmarshaling {

  convenience init(object: MarshaledObject) throws {
    self.init()

    self.name               = try object.value(for: "name")
    self.classification     = try object.value(for: "classification")
    self.designation        = try object.value(for: "designation")
    self.averageHeight      = try object.value(for: "average_height")
    self.averageLifespan    = try object.value(for: "average_lifespan")
    self.eyeColors          = try object.value(for: "eye_colors")
    self.hairColors         = try object.value(for: "hair_colors")
    self.skinColors         = try object.value(for: "skin_color")
    self.language           = try object.value(for: "language")
    self.homeworld          = try object.value(for: "homeworld")
    self.url                = try object.value(for: "url")
    self.created            = try object.value(for: "created")
    self.edited             = try object.value(for: "edited")


    if let people: [String] = try? object.value(for: "people") {
      for url in people {
        let peopleObject    = Character(url: url)
        self.people.append(peopleObject)
      }
    }
    if let films: [String]  = try? object.value(for: "films") {
      for url in films {
        let filmObject      = Film(url: url)
        self.films.append(filmObject)
      }
    }
  }
}

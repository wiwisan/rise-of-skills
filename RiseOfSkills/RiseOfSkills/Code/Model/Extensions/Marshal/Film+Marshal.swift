//  Film+Marshal.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Foundation
import RealmSwift
import Marshal

extension Film: Unmarshaling {

  convenience init(object: MarshaledObject) throws {
    self.init()

    self.title                  = try object.value(for: "title")
    self.episodeId              = try object.value(for: "episode_id")
    self.openingCrawl           = try object.value(for: "opening_crawl")
    self.director               = try object.value(for: "director")
    self.producer               = try object.value(for: "producer")
    self.releaseDate            = try object.value(for: "release_date")
    self.url                    = try object.value(for: "url")
    self.created                = try object.value(for: "created")
    self.edited                 = try object.value(for: "edited")


    if let starships: [String]  = try? object.value(for: "starships") {
      for url in starships {
        let starShipObject      = Starship(url: url)
        self.starships.append(starShipObject)
      }
    }
    if let vehicles: [String]   = try? object.value(for: "vehicles") {
      for url in vehicles {
        let vehicleObject       = Vehicle(url: url)
        self.vehicles.append(vehicleObject)
      }
    }
    if let characters: [String] = try? object.value(for: "characters") {
      for url in characters {
        let characterObject     = Character(url: url)
        self.characters.append(characterObject)
      }
    }
    if let planets: [String]    = try? object.value(for: "planets") {
      for url in planets {
        let planetObject        = Planet(url: url)
        self.planets.append(planetObject)
      }
    }
  }
}

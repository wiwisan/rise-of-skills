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
        if let starship = Starship.findFirst(withKey: url) {
          self.starships.append(starship)
        }
      }
    }
    if let vehicles: [String]   = try? object.value(for: "vehicles") {
      for url in vehicles {
        if let vehicle = Vehicle.findFirst(withKey: url) {
          self.vehicles.append(vehicle)
        }
      }
    }
    if let characters: [String] = try? object.value(for: "characters") {
      for url in characters {
        if let character = Character.findFirst(withKey: url) {
          self.characters.append(character)
        }
      }
    }
    if let planets: [String]    = try? object.value(for: "planets") {
      for url in planets {
        if let planet = Planet.findFirst(withKey: url) {
          self.planets.append(planet)
        }
      }
    }
  }
}

//  Film+Marshal.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Foundation
import RealmSwift
import Marshal

extension Starship: Unmarshaling {

  convenience init(object: MarshaledObject) throws {
    self.init()

    self.name                 = try object.value(for: "name")
    self.model                = try object.value(for: "model")
    self.starshipClass        = try object.value(for: "starship_class")
    self.manufacturer         = try object.value(for: "manufacturer")
    self.costInCredits        = try object.value(for: "cost_in_credits")
    self.length               = try object.value(for: "length")
    self.crew                 = try object.value(for: "crew")
    self.passengers           = try object.value(for: "passengers")
    self.maxAtmospheringSpeed = try object.value(for: "max_atmosphering_speed")
    self.hyperdriveRating     = try object.value(for: "hyperdrive_rating")
    self.MGLT                 = try object.value(for: "MGLT")
    self.cargoCapacity        = try object.value(for: "cargo_capacity")
    self.consumables          = try object.value(for: "consumables")
    self.url                  = try object.value(for: "url")
    self.created              = try object.value(for: "created")
    self.edited               = try object.value(for: "edited")


    if let films: [String]    = try? object.value(for: "films") {
      for url in films {
        let filmObject        = Film(url: url)
        self.films.append(filmObject)
      }
    }
    if let pilots: [String]   = try? object.value(for: "pilots") {
      for url in pilots {
        let pilotObject       = Character(url: url)
        self.pilots.append(pilotObject)
      }
    }
  }
}

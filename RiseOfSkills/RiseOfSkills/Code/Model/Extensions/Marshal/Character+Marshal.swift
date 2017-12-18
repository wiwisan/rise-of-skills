//  Film+Marshal.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Foundation
import RealmSwift
import Marshal

extension Character: Unmarshaling {

  convenience init(object: MarshaledObject) throws {
    self.init()

    self.name                  = try object.value(for: "name")
    self.birthYear             = try object.value(for: "birth_year")
    self.eyeColor              = try object.value(for: "eye_color")
    self.gender                = try object.value(for: "gender")
    self.hairColor             = try object.value(for: "hair_color")
    self.height                = try object.value(for: "height")
    self.mass                  = try object.value(for: "mass")
    self.skinColor             = try object.value(for: "skin_color")
    self.homeworld             = try object.value(for: "homeworld")
    self.url                   = try object.value(for: "url")
    self.created               = try object.value(for: "created")
    self.edited                = try object.value(for: "edited")


    if let films: [String]     = try? object.value(for: "films") {
      for url in films {
        if let film = Film.findFirst(withKey: url) {
          self.films.append(film)
          
        }
      }
    }
    if let species: [String]   = try? object.value(for: "species") {
      for url in species {
        if let specie = Species.findFirst(withKey: url) {
          self.species.append(specie)
        }
      }
    }
    if let starships: [String] = try? object.value(for: "starships") {
      for url in starships {
        if let starship = Starship.findFirst(withKey: url) {
          self.starships.append(starship)
        }
      }
    }
    if let vehicles: [String]  = try? object.value(for: "vehicles") {
      for url in vehicles {
        if let vehicle = Vehicle.findFirst(withKey: url) {
          self.vehicles.append(vehicle)
        }
      }
    }
  }
}

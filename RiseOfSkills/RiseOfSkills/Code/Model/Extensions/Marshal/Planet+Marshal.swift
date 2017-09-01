//  Film+Marshal.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Foundation
import RealmSwift
import Marshal

extension Planet: Unmarshaling {

  convenience init(object: MarshaledObject) throws {
    self.init()

    self.name                  = try object.value(for: "name")
    self.diameter              = try object.value(for: "diameter")
    self.rotationPeriod        = try object.value(for: "rotation_period")
    self.orbitalPeriod         = try object.value(for: "orbital_period")
    self.gravity               = try object.value(for: "gravity")
    self.population            = try object.value(for: "population")
    self.climate               = try object.value(for: "climate")
    self.terrain               = try object.value(for: "terrain")
    self.surfaceWater          = try object.value(for: "surface_water")
    self.url                   = try object.value(for: "residents")
    self.created               = try object.value(for: "created")
    self.edited                = try object.value(for: "edited")


    if let films: [String]     = try? object.value(for: "films") {
      for url in films {
        if let film = Film.findFirst(withKey: url) {
          self.films.append(film)
        }
      }
    }
    if let residents: [String] = try? object.value(for: "residents") {
      for url in residents {
        if let resident = Character.findFirst(withKey: url) {
          self.residents.append(resident)
        }
      }
    }
  }
}

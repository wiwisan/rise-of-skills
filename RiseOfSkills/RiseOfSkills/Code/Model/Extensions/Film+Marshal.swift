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
    
    self.title = try object.value(for: "title")
    self.episodeId = try object.value(for: "episode_id")
    self.openingCrawl = try object.value(for: "opening_crawl")
    self.director = try object.value(for: "director")
    self.producer = try object.value(for: "producer")
    self.releaseDate = try object.value(for: "release_date")
    self.url = try object.value(for: "url")
    self.created = try object.value(for: "created")
    self.edited = try object.value(for: "edited")
    
    
//    if let species: [RealmString] = try? object.value(for: "species") {
//      self.species.append(objectsIn: species)
//    }
//    if let starships: [RealmString] = try? object.value(for: "starships") {
//      self.starships.append(objectsIn: starships)
//    }
//    if let vehicles: [RealmString] = try? object.value(for: "vehicles") {
//      self.vehicles.append(objectsIn: vehicles)
//    }
//    if let characters: [RealmString] = try? object.value(for: "characters") {
//      self.characters.append(objectsIn: characters)
//    }
//    if let planets: [RealmString] = try? object.value(for: "planets") {
//      self.planets.append(objectsIn: planets)
//    }
  }
}

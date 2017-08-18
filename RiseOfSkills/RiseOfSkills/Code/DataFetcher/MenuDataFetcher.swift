//
//  MenuDataFetcher.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import Foundation
import RealmSwift

struct MenuDataFetcher {
  let items: [MenuItem]
  let validItems: [MenuItem]? =  []
  
  init() {
    
    let films = MenuItem(identifier: .film, index: 0, title: "Films", icon: "🎥", background: "swfilms.jpg", data: Film())
    let characters = MenuItem(identifier: .character, index: 1, title: "Personnages", icon: "👨🏻", background: "swchar.jpg", data: Character())
    let planets = MenuItem(identifier: .planet, index: 2, title: "Planètes", icon: "🌏", background: "swplanet.jpg", data: Planet())
    let species = MenuItem(identifier: .specie, index: 3, title: "Espèces", icon: "👽", background: "swspecies.jpg", data: Species())
    let starships = MenuItem(identifier: .starship, index: 4, title: "Vaisseaux", icon: "🚀", background: "swstarship.jpg", data: Starship())
    let vehicles = MenuItem(identifier: .vehicle, index: 5, title: "Véhicules", icon: "🚡", background: "swvehicles.jpeg", data: Vehicle())
    
    self.items = [films, characters, planets, species, starships, vehicles]
    
    for item in self.items {
      guard let realm = item.data.realm else {
        fatalError("")
      }
      
      if let object = NSClassFromString(item.data.className), let objectType = object as? Object.Type {
        if realm.objects(objectType).isEmpty {
          let dataFetcher = DataFetcher()
          
          switch item.identifier {
          case .film:
            dataFetcher.fetchFilms()
          case .character:
            dataFetcher.fetchCharacters()
          case .planet:
            dataFetcher.fetchPlanets()
          case .specie:
            dataFetcher.fetchSpecies()
          case .starship:
            dataFetcher.fetchStarships()
          case .vehicle:
            dataFetcher.fetchVehicles()
          }
        } else {
          self.validItems?.append(item)
        }
      }
    }
    
  }
}

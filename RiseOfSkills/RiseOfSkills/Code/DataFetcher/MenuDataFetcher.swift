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
//  let validItems: [MenuItem]? =  []
  
  init() {
    
    let films      = MenuItem(identifier: .film, index: 0, title: L10n.Menu.Title.films, icon: L10n.Menu.Icon.films, background: Asset.Menu.swfilms.image, data: Film())
    let characters = MenuItem(identifier: .character, index: 1, title: L10n.Menu.Title.characters, icon: L10n.Menu.Icon.characters, background: Asset.Menu.swchar.image, data: Character())
    let planets    = MenuItem(identifier: .planet, index: 2, title: L10n.Menu.Title.planets, icon: L10n.Menu.Icon.planets, background: Asset.Menu.swplanet.image, data: Planet())
    let species    = MenuItem(identifier: .specie, index: 3, title: L10n.Menu.Title.species, icon: L10n.Menu.Icon.species, background: Asset.Menu.swspecies.image, data: Species())
    let starships  = MenuItem(identifier: .starship, index: 4, title: L10n.Menu.Title.starships, icon: L10n.Menu.Icon.starships, background: Asset.Menu.swstarship.image, data: Starship())
    let vehicles   = MenuItem(identifier: .vehicle, index: 5, title: L10n.Menu.Title.vehicules, icon: L10n.Menu.Icon.vehicules, background: Asset.Menu.swvehicles.image, data: Vehicle())
    
    self.items = [films, characters, planets, species, starships, vehicles]
    
    /* for item in self.items {
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
    } */
    
  }
}

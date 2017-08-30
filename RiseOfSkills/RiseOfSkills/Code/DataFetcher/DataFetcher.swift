//  DataFetcher.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.

import Foundation
import Alamofire
import RealmSwift

final class DataFetcher {
  
  func fetchAll() {
    self.fetchFilms()
    self.fetchPlanets()
    self.fetchSpecies()
    self.fetchStarships()
    self.fetchVehicles()
    self.fetchCharacters()
  }
  
  // - MARK: Characters
  
  func fetchCharacters() {
    
    let url = URL(string: Router.characters(id: "").baseURL)!
    let urlRequest = URLRequest(url: url)
    
    // Print path of db realm file
    print(Realm.Configuration.defaultConfiguration.fileURL ?? "")
    
    Alamofire.request(urlRequest)
      .responseJSON(completionHandler: { (response) in
        switch response.result {
        case .success:
          if let valueDict = response.result.value as? [String: Any], let results = valueDict["results"] as? [Any] {
            do {
              let realm = try Realm()
              try realm.write {
                for result in results {
                  if let character: Character = try? Character.value(from: result) {
                    realm.add(character, update: true)
                  }
                }
              }
            } catch {
              print("Cannot access Realm instance for url: \(url)")
            }
          }
        case .failure:
          print("Call API Failed for url: \(url)")
        }
      })
  }
  
  // - MARK: Films
  
  func fetchFilms() {
    
    let url = URL(string: Router.films(id: "").baseURL)!
    let urlRequest = URLRequest(url: url)
    
    Alamofire.request(urlRequest)
      .responseJSON(completionHandler: { (response) in
        switch response.result {
        case .success:
          if let valueDict = response.result.value as? [String: Any], let results = valueDict["results"] as? [Any] {
            do {
              let realm = try Realm()
              try realm.write {
                for result in results {
                  if let film: Film = try? Film.value(from: result) {
                    realm.add(film, update: true)
                  }
                }
              }
            } catch {
              print("Cannot access Realm instance for url: \(url)")
            }
          }
        case .failure:
          print("Call API Failed for url: \(url)")
        }
      })
  }
  
  // - MARK: Planets
  
  func fetchPlanets() {
    
    let url = URL(string: Router.planets(id: "").baseURL)!
    let urlRequest = URLRequest(url: url)
    
    Alamofire.request(urlRequest)
      .responseJSON(completionHandler: { (response) in
        switch response.result {
        case .success:
          if let valueDict = response.result.value as? [String: Any], let results = valueDict["results"] as? [Any] {
            do {
              let realm = try Realm()
              try realm.write {
                for result in results {
                  if let planet: Planet = try? Planet.value(from: result) {
                    realm.add(planet, update: true)
                  }
                }
              }
            } catch {
              print("Cannot access Realm instance for url: \(url)")
            }
          }
        case .failure:
          print("Call API Failed for url: \(url)")
        }
      })
  }
  
  // - MARK: Species
  
  func fetchSpecies() {
    
    let url = URL(string: Router.species(id: "").baseURL)!
    let urlRequest = URLRequest(url: url)
    
    Alamofire.request(urlRequest)
      .responseJSON(completionHandler: { (response) in
        switch response.result {
        case .success:
          if let valueDict = response.result.value as? [String: Any], let results = valueDict["results"] as? [Any] {
            do {
              let realm = try Realm()
              try realm.write {
                for result in results {
                  if let specie: Species = try? Species.value(from: result) {
                    realm.add(specie, update: true)
                  }
                }
              }
            } catch {
              print("Cannot access Realm instance for url: \(url)")
            }
          }
        case .failure:
          print("Call API Failed for url: \(url)")
        }
      })
  }
  
  // - MARK: Starships
  
  func fetchStarships() {
    
    let url = URL(string: Router.starships(id: "").baseURL)!
    let urlRequest = URLRequest(url: url)
    
    Alamofire.request(urlRequest)
      .responseJSON(completionHandler: { (response) in
        switch response.result {
        case .success:
          if let valueDict = response.result.value as? [String: Any], let results = valueDict["results"] as? [Any] {
            do {
              let realm = try Realm()
              try realm.write {
                for result in results {
                  if let starship: Starship = try? Starship.value(from: result) {
                    realm.add(starship, update: true)
                  }
                }
              }
            } catch {
              print("Cannot access Realm instance for url: \(url)")
            }
          }
        case .failure:
          print("Call API Failed for url: \(url)")
        }
      })
  }
  
  // - MARK: Vehicles
  
  func fetchVehicles() {
    
    let url = URL(string: Router.vehicles(id: "").baseURL)!
    let urlRequest = URLRequest(url: url)
    
    Alamofire.request(urlRequest)
      .responseJSON(completionHandler: { (response) in
        switch response.result {
        case .success:
          if let valueDict = response.result.value as? [String: Any], let results = valueDict["results"] as? [Any] {
            do {
              let realm = try Realm()
              try realm.write {
                for result in results {
                  if let vehicle: Vehicle = try? Vehicle.value(from: result) {
                    realm.add(vehicle, update: true)
                  }
                }
              }
            } catch {
              print("Cannot access Realm instance for url: \(url)")
            }
          }
        case .failure:
          print("Call API Failed for url: \(url)")
        }
      })
  }
  
}

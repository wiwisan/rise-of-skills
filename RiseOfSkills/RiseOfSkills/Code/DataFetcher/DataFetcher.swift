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
          if let valueDict = response.result.value as? [String: Any] {
            do {
              let realm = try Realm()
              try realm.write {
                if let characterList: CharacterList = try? CharacterList.value(from: valueDict) {
                  realm.add(characterList, update: true)
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
          if let valueDict = response.result.value as? [String: Any] {
            do {
              let realm = try Realm()
              try realm.write {
                if let filmList: FilmList = try? FilmList.value(from: valueDict) {
                  realm.add(filmList, update: true)
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
          if let valueDict = response.result.value as? [String: Any] {
            do {
              let realm = try Realm()
              try realm.write {
                if let planetList: PlanetList = try? PlanetList.value(from: valueDict) {
                  realm.add(planetList, update: true)
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
          if let valueDict = response.result.value as? [String: Any] {
            do {
              let realm = try Realm()
              try realm.write {
                if let speciesList: SpeciesList = try? SpeciesList.value(from: valueDict) {
                  realm.add(speciesList, update: true)
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
          if let valueDict = response.result.value as? [String: Any] {
            do {
              let realm = try Realm()
              try realm.write {
                if let starshipList: StarshipList = try? StarshipList.value(from: valueDict) {
                  realm.add(starshipList, update: true)
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
          if let valueDict = response.result.value as? [String: Any] {
            do {
              let realm = try Realm()
              try realm.write {
                if let vehicleList: VehicleList = try? VehicleList.value(from: valueDict) {
                  realm.add(vehicleList, update: true)
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

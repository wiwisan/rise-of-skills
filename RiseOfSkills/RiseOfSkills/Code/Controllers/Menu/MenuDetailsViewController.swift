//
//  MenuDetailsViewController.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import UIKit
import RealmSwift

final class MenuDetailsViewController: UIViewController {
  
  // - MARK: Outlets
  
  @IBOutlet weak var ibTableView: UITableView!
  @IBOutlet weak var ibBackgroundView: UIView!
  
  // - MARK: Properties
  
  var item: MenuItem?
  var details: [Object] = []
  var nbOfElements = 0
  
  // - MARK: Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = self.item?.title
    
    self.ibTableView.dataSource = self
    self.ibTableView.delegate = self
    self.ibBackgroundView.setGradientBackground()
    self.ibTableView.register(UINib(nibName: "MenuDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "menuDetailsCell")
    self.ibTableView.estimatedRowHeight = 80.0
    self.ibTableView.rowHeight = UITableViewAutomaticDimension
    
    if let item = self.item {
      self.details = self.details(forItem: item)
    }
  }
  
  // MARK: Internal Methods
  
  func details(forItem item: MenuItem) -> [Object] {
    switch item.identifier {
    case .film:
      let filmList = Array(FilmList.findAll()) as [FilmList]
      let films = Array(filmList[0].results)
      self.nbOfElements = films.count
      return films
    case .character:
      let characterList = Array(CharacterList.findAll()) as [CharacterList]
      let characters = Array(characterList[0].results)
      self.nbOfElements = characters.count
      return characters
    case .planet:
      let planetList = Array(PlanetList.findAll()) as [PlanetList]
      let planets = Array(planetList[0].results)
      self.nbOfElements = planets.count
      return planets
    case .specie:
      let speciesList = Array(SpeciesList.findAll()) as [SpeciesList]
      let species = Array(speciesList[0].results)
      self.nbOfElements = species.count
      return species
    case .starship:
      let starshipList = Array(StarshipList.findAll()) as [StarshipList]
      let starships = Array(starshipList[0].results)
      self.nbOfElements = starships.count
      return starships
    case .vehicle:
      let vehicleList = Array(VehicleList.findAll()) as [VehicleList]
      let vehicles = Array(vehicleList[0].results)
      self.nbOfElements = vehicles.count
      return vehicles
    }
  }
  
  func data(forDetail detail: Object) -> [String] {
    var detailArr: [String]?
    
    switch detail {
    case is Film:
      if let film = detail as? Film, film.title != "" {
        detailArr = [film.title, film.director]
      }
    case is Character:
      if let character = detail as? Character {
        detailArr = [character.name, character.gender]
      }
    case is Planet:
      if let planet = detail as? Planet {
        detailArr = [planet.name, planet.climate]
      }
    case is Species:
      if let specie = detail as? Species {
        detailArr = [specie.name, specie.classification]
      }
    case is Starship:
      if let starship = detail as? Starship {
        detailArr = [starship.name, starship.model]
      }
    case is Vehicle:
      if let vehicle = detail as? Vehicle {
        detailArr = [vehicle.name, vehicle.model]
      }
    default:
      detailArr = []
    }
    return detailArr ?? []
  }
}

// - MARK: UITableViewDataSource

extension MenuDetailsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.details.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "menuDetailsCell"
    
    guard let cell = self.ibTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MenuDetailsTableViewCell else {
      fatalError("Oh No 😯! Unable to dequeue cell with identifier: \(cellIdentifier). ☹️")
    }
    
    if !self.data(forDetail: self.details[indexPath.row]).isEmpty {
      let data = self.data(forDetail: self.details[indexPath.row])
      cell.ibTitleLabel.text = data[0]
      cell.ibDescriptionLabel.text = data[1]
    }
    
    return cell
  }
}

// - MARK: UITableViewDelegate

extension MenuDetailsViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyBoard : UIStoryboard = UIStoryboard(name: "Details", bundle:nil)
    guard let detailsCollectionViewController = storyBoard.instantiateViewController(withIdentifier: "detailsCollectionViewController") as? DetailsCollectionViewController else {
      fatalError("Could not instantiate viewController with identifier: detailsCollectionViewController")
    }
    
    self.show(detailsCollectionViewController, sender: nil)
  }
}

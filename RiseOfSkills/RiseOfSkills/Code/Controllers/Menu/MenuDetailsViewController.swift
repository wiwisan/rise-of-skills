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
  var iPadDetailsViewController: DetailsViewController?
  var previewingContext: UIViewControllerPreviewing?
  
  // - MARK: Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = self.item?.title
    
    // May the Force Touch Be With You: Check if device has 3D Touch
    if (traitCollection.forceTouchCapability == .available) {
      self.previewingContext = self.registerForPreviewing(with: self, sourceView: self.ibTableView)
    }
    
    self.ibTableView.dataSource = self
    self.ibTableView.delegate = self
    self.ibBackgroundView.setGradientBackground()
    self.ibTableView.register(UINib(nibName: "MenuDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "menuDetailsCell")
    self.ibTableView.estimatedRowHeight = 80.0
    self.ibTableView.rowHeight = UITableViewAutomaticDimension
    
    if let item = self.item {
      self.details = self.details(forItem: item)
    }
    
    let index = IndexPath(row: 0, section: 0)
    self.ibTableView.selectRow(at: index, animated: false, scrollPosition: .top)
    if UIDevice.current.userInterfaceIdiom == .pad {
      self.iPadDetailsViewController?.detail = self.details[index.row]
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
        let subTitle = "\(film.created) - \(film.director)"
        detailArr = [film.title, subTitle]
      }
    case is Character:
      if let character = detail as? Character {
        let subTitle = "\(character.species) - \(character.gender)"
        detailArr = [character.name, subTitle]
      }
    case is Planet:
      if let planet = detail as? Planet {
        let subTitle = "\(planet.population) - \(planet.climate)"
        detailArr = [planet.name, subTitle]
      }
    case is Species:
      if let specie = detail as? Species {
        let subTitle = "\(specie.classification) - \(specie.language)"
        detailArr = [specie.name, subTitle]
      }
    case is Starship:
      if let starship = detail as? Starship {
        let subTitle = "\(starship.starshipClass) - \(starship.model)"
        detailArr = [starship.name, subTitle]
      }
    case is Vehicle:
      if let vehicle = detail as? Vehicle {
        let subTitle = "\(vehicle.vehicleClass) - \(vehicle.model)"
        detailArr = [vehicle.name, subTitle]
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
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    
    if traitCollection.forceTouchCapability == .available {
      if self.previewingContext == nil {
        self.previewingContext = self.registerForPreviewing(with: self, sourceView: self.ibTableView)
      }
    } else {
      if let previewingContext = self.previewingContext {
        self.unregisterForPreviewing(withContext: previewingContext)
        self.previewingContext = nil
      }
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if UIDevice.current.userInterfaceIdiom == .pad {
      self.iPadDetailsViewController?.detail = self.details[indexPath.row]
    }
    else {
      let storyBoard : UIStoryboard = UIStoryboard(name: "Details", bundle:nil)
      guard let detailsCollectionViewController = storyBoard.instantiateViewController(withIdentifier: "detailsCollectionViewController") as? DetailsCollectionViewController else {
        fatalError("Could not instantiate viewController with identifier: detailsCollectionViewController")
      }
      
      detailsCollectionViewController.details = self.details
      detailsCollectionViewController.currentIndexPath = indexPath
      self.show(detailsCollectionViewController, sender: nil)
    }
  }
}

// - MARK: UIViewControllerPreviewingDelegate

extension MenuDetailsViewController: UIViewControllerPreviewingDelegate {
  
  func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
    
    guard let indexPath = self.ibTableView?.indexPathForRow(at: location) else {
      return nil
    }
    guard let cell = self.ibTableView?.cellForRow(at: indexPath) else {
      return nil
    }
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Details", bundle:nil)
    guard let detailsCollectionViewController = storyBoard.instantiateViewController(withIdentifier: "detailsCollectionViewController") as? DetailsCollectionViewController else {
      fatalError("Could not instantiate viewController with identifier: detailsCollectionViewController")
    }
    detailsCollectionViewController.preferredContentSize = CGSize(width: 0.0, height: 500)
    detailsCollectionViewController.details = self.details
    detailsCollectionViewController.currentIndexPath = indexPath
    
    previewingContext.sourceRect = cell.frame
    
    return detailsCollectionViewController
  }
  
  func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
   self.show(viewControllerToCommit, sender: self)
  }
}

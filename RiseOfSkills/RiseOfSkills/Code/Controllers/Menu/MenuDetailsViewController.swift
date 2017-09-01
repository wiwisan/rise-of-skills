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
      return Array(Film.findAll())
    case .character:
      return Array(Character.findAll())
    case .planet:
      return Array(Planet.findAll())
    case .specie:
      return Array(Species.findAll())
    case .starship:
      return Array(Starship.findAll())
    case .vehicle:
      return Array(Vehicle.findAll())
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
        detailArr = [planet.name, planet.language]
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
  
}

//
//  DetailsViewController.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import UIKit
import RealmSwift

final class DetailsViewController: UIViewController {
  
  // MARK: Properties
  
  @IBOutlet weak var ibTitleLabel: UILabel!
  @IBOutlet weak var ibSubTitleLabel: UILabel!
  
  var detail: Object? {
    didSet {
      if let detail = self.detail, !self.data(forDetail: detail).isEmpty {
        self.ibTitleLabel.text = self.data(forDetail: detail)[0]
        self.ibSubTitleLabel.text = self.data(forDetail: detail)[1]
      }
    }
  }
  
  // MARK: Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //
  }
  
  
  // MARK: Internal Methods
  
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

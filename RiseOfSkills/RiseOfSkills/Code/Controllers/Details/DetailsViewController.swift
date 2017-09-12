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
  
  var detail: Object? {
    didSet {
      if let detail = self.detail, !self.data(forDetail: detail).isEmpty {
        self.ibTitleLabel.text = self.data(forDetail: detail)[0]
      }
    }
  }
  
  // MARK: Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  // MARK: Internal Methods
  
  func data(forDetail detail: Object) -> [String] {
    var detailArr: [String]?
    
    switch detail {
    case is Film:
      if let film = detail as? Film, film.title != "" {
        detailArr = [film.title]
      }
    case is Character:
      if let character = detail as? Character {
        detailArr = [character.name]
      }
    case is Planet:
      if let planet = detail as? Planet {
        detailArr = [planet.name]
      }
    case is Species:
      if let specie = detail as? Species {
        detailArr = [specie.name]
      }
    case is Starship:
      if let starship = detail as? Starship {
        detailArr = [starship.name]
      }
    case is Vehicle:
      if let vehicle = detail as? Vehicle {
        detailArr = [vehicle.name]
      }
    default:
      detailArr = []
    }
    return detailArr ?? []
  }
  
}

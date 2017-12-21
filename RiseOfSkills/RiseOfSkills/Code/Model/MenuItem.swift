//
//  MenuItem.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import UIKit
import RealmSwift

enum ItemIdentifier {
  case film
  case character
  case planet
  case specie
  case starship
  case vehicle
}

struct MenuItem {
  let identifier: ItemIdentifier
  let index: Int
  let title: String
  let icon: String
  let background: UIImage
  let data: Object
}

//
//  MenuViewController.swift
//  RiseOfIosSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import UIKit

final class MenuViewController: UIViewController {
  
  // MARK - Outlets
  
  @IBOutlet var ibTableView: UITableView!
  
  // MARK - Initializers
  
  let numberOfCells = 3
  var menuListTitle: [String]?
  var menuListEmoji: [String]?
  var menuListImage: [String]?
  var menuListControllers: [String]?
  
  // MARK - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.menuListTitle = ["Films", "Personnages", "Planètes", "Espèces", "Vaisseaux", "Véhicules"]
    self.menuListEmoji = ["🎥", "👨🏻", "🌏", "👽", "🚀", "🚡"]
    self.menuListImage = ["swfilms.jpg", "swchar.jpg", "swplanet.jpg", "swspecies.jpg", "swstarship.jpg", "swvehicles.jpeg"]

    self.ibTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell")
    
    self.ibTableView.rowHeight = 200
    self.ibTableView.estimatedRowHeight = 200
    
    self.ibTableView.dataSource = self
    self.ibTableView.delegate = self
  }
}

// MARK - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let menu = self.menuListTitle else {
      fatalError("Oh no ! There is no menu ! ☹️")
    }
    return menu.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "tableViewCell"
    
    guard let cell = self.ibTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TableViewCell else {
      fatalError("Oh No 😯! Unable to dequeue cell with identifier: \(cellIdentifier). ☹️")
    }
    
    cell.ibMenuTitle.text = self.menuListTitle?[indexPath.row]
    cell.ibMenuItemEmoji.text = self.menuListEmoji?[indexPath.row]
    if let image = self.menuListImage?[indexPath.row] {
      cell.ibMenuImage.image = UIImage(named: image)
    }
    
    return cell
  }
}

// MARK - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Menu", bundle:nil)
    
    guard let menuDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "MenuDetailsViewController") as? MenuDetailsViewController else {
      fatalError("Could not instantiate MenuDetailsViewController")
    }
    self.show(menuDetailsViewController, sender: nil)
  }
}

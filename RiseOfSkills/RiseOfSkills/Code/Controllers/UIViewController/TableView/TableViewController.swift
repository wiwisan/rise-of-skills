//
//  TableViewController.swift
//  RiseOfIosSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import UIKit

final class TableViewController: UIViewController {
  
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
    
    let backgroundColor = UIColor(red: 0, green: 185, blue: 255, alpha: 1.0)
    self.navigationController?.navigationBar.barTintColor = backgroundColor
    
    self.ibTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell")
    
    self.ibTableView.rowHeight = 200
    self.ibTableView.estimatedRowHeight = 200
    
    self.ibTableView.dataSource = self
    self.ibTableView.delegate = self
  }
}

// MARK - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
  
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
extension TableViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "ViewController", bundle:nil)
    
    guard let collectionViewController = storyBoard.instantiateViewController(withIdentifier: "CollectionViewController") as? CollectionViewController else {
      fatalError("Could not instantiate CollectionViewController")
    }
    self.show(collectionViewController, sender: nil)
  }
}

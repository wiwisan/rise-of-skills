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
  var menuList: [MenuItem]?
  var menuListControllers: [String]?
  
  // MARK - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Menu".uppercased()
    
    self.menuList = MenuDataFetcher.init().items

    self.ibTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuTableViewCell")
    
    self.ibTableView.rowHeight = 200
    self.ibTableView.estimatedRowHeight = 200
    
    self.ibTableView.dataSource = self
    self.ibTableView.delegate = self
  }
}

// MARK - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let menu = self.menuList else {
      fatalError("Oh no ! There is no menu ! ☹️")
    }
    return menu.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "menuTableViewCell"
    
    guard let cell = self.ibTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MenuTableViewCell else {
      fatalError("Oh No 😯! Unable to dequeue cell with identifier: \(cellIdentifier). ☹️")
    }
    
    cell.ibMenuTitle.text = self.menuList?[indexPath.row].title
    cell.ibMenuItemEmoji.text = self.menuList?[indexPath.row].icon
    if let image = self.menuList?[indexPath.row].background {
      cell.ibMenuImage.image = UIImage(named: image)
    }
    
    return cell
  }
}

// MARK - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if (UIDevice.current.userInterfaceIdiom == .pad) {
      let storyBoard : UIStoryboard = UIStoryboard(name: "Details", bundle:nil)
      guard let detailsIpadViewController = storyBoard.instantiateViewController(withIdentifier: "detailsIpadViewController") as? DetailsIpadViewController else {
        fatalError("Could not instantiate viewController with identifier: detailsIpadViewController")
      }
      
      detailsIpadViewController.item = self.menuList?[indexPath.row]
      // detailsIpadViewController.currentIndexPath = indexPath
      self.show(detailsIpadViewController, sender: nil)
    } else {
      let storyBoard : UIStoryboard = UIStoryboard(name: "Menu", bundle:nil)
      
      guard let menuDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "MenuDetailsViewController") as? MenuDetailsViewController else {
        fatalError("Could not instantiate MenuDetailsViewController")
      }
      menuDetailsViewController.item = self.menuList?[indexPath.row]
      self.show(menuDetailsViewController, sender: nil)
    }
  }
}

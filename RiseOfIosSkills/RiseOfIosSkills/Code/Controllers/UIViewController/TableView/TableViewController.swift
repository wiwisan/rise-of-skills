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
  
  // MARK - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.ibTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell")
  }
}

// MARK - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.numberOfCells
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "tableViewCell"
    
    guard let cell = self.ibTableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
      fatalError("Cannot dequeue cell.")
    }
    return cell
  }
}

// MARK - UITableViewDelegate
extension TableViewController: UITableViewDelegate {
  // Delegate methods here
}

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
    self.ibTableView.register(UINib(nibName: "TableViewHeaderFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "tableViewHeaderFooterView")
  }
}

// MARK - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.numberOfCells
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "tableViewCell"
    
    guard let cell = self.ibTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TableViewCell else {
      fatalError("Oh No 😯! Unable to dequeue cell with identifier: \(cellIdentifier). ☹️")
    }
    return cell
  }
}

// MARK - UITableViewDelegate
extension TableViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let viewIdentifier = "tableViewHeaderFooterView"
    
    guard let view = self.ibTableView.dequeueReusableHeaderFooterView(withIdentifier: viewIdentifier) else {
      fatalError("Oh No 😯! Unable to dequeue view with identifier: \(viewIdentifier). ☹️")
    }
    return view
  }
  
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 100.0
  }
}

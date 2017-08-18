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
  
  // - MARK: Properties
  
  var viewTitle: String?
  
  // -MARK: Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.setGradientBackground()
    
    self.ibTableView.delegate = self
  }
}

// - MARK: UITableViewDataSource

extension MenuDetailsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "menuDetailsCell"
    
    guard let cell = self.ibTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MenuDetailsTableViewCell else {
      fatalError("Oh No 😯! Unable to dequeue cell with identifier: \(cellIdentifier). ☹️")
    }
    
    cell.ibTitleLabel.text = "Titre 1"
    cell.ibDescriptionLabel.text = "Desc"
    
    return cell
  }
}

// - MARK: UITableViewDelegate

extension MenuDetailsViewController: UITableViewDelegate {
  
}

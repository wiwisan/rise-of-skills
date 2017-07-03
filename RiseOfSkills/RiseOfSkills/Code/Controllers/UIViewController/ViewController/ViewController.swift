//
//  ViewController.swift
//  RiseOfIosSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Foundation
import UIKit
import Alamofire

final class ViewController: UIViewController {
  
  // MARK - Outlets
  
  @IBOutlet weak var ibContainerView: UIView!
  @IBOutlet weak var ibTitleLabel: UILabel!
  
  // MARK - Initializers
  
  // MARK - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.ibTitleLabel.text = "Hi ! I'm a UIViewController! That's coool 😎"
    
    var filmJson: Film?
    let url = URL(string: Router.films(id: "").baseURL)!
    let urlRequest = URLRequest(url: url)
    Alamofire.request(urlRequest).responseJSON { response in
      debugPrint(response)
      
      if let json = response.result.value {
        print("JSON: \(json)")
        filmJson = json as? Film
        print("FILM: \(filmJson)")
      }
    }
  }
}

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
      print(response)
      //to get status code
      if let status = response.response?.statusCode {
        switch(status){
        case 201:
          print("example success")
        default:
          print("error with response status: \(status)")
        }
      }
      //to get JSON return value
      if let result = response.result.value {
        if let JSON = result as? NSDictionary {
//          print(JSON.object(forKey: "planets"))
        }
      }
    }
  }
}

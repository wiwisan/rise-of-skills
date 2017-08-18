//
//  Alamofire+RiseOfSkills.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

extension DataRequest {
  
  // - MARK: Film
  
  func filmList() {
    
    if let url = URL(string: Router.films(id: "").baseURL) {
      let urlRequest = URLRequest(url: url)
      
      Alamofire.request(urlRequest)
        .responseJSON(completionHandler: { (response) in
          switch response.result {
          case .success:
            if let valueDict = response.result.value as? [String: Any], let results = valueDict["results"] as? [Any] {
              do {
                let realm = try Realm()
                try realm.write {
                  for result in results {
                    if let film: Film = try? Film.value(from: result) {
                      realm.add(film, update: true)
                    }
                  }
                }
              } catch {
                print("error..")
              }
            }
          case .failure:
            print("FAILURE..")
          }
        })
    }
  }
  
  // - MARK: Character
  
  // - MARK: Planet
  
  // - MARK: Species
  
  // - MARK: Starship
  
  // - MARK: Vehicle
}

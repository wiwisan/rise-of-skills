//  DataFetcher.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.



import Foundation
import Alamofire
import RealmSwift


final class DataFetcher {
  
  func fetchFilms() -> Bool {
    
    var hasData = false
    let url = URL(string: Router.films(id: "").baseURL)!
    let urlRequest = URLRequest(url: url)
    
    // Print path of db realm file
    print(Realm.Configuration.defaultConfiguration.fileURL ?? "")
    
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
              print("Cannot access Realm instance for url: \(url)")
            }
            
            hasData = results.isEmpty ? false : true
          }
        case .failure:
          print("Call API Failed for url: \(url)")
          hasData = false
        }
      })
    return hasData
  }
  
}

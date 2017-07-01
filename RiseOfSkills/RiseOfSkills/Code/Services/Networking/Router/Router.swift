//  Router.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Foundation
import Alamofire

enum Router {
  
  case films(id: String)
  case people(id: String)
  case planets(id: String)
  case species(id: String)
  case starships(id: String)
  case vehicles(id: String)
}

// MARK - Routing
extension Router: Routing {
  
  var baseURL: String {
    let url = "http://swapi.co/api"
    return url.appending(self.path)
  }
  
  var path: String {
    var path = ""
    switch self {
    case .films(let id):
      path = "/films" + "/\(id)"
    case .people(let id):
      path = "/people" + "/\(id)"
    case .planets(let id):
      path = "/planets" + "/\(id)"
    case .species(let id):
      path = "/species" + "/\(id)"
    case .starships(let id):
      path = "/starships" + "/\(id)"
    case .vehicles(let id):
      path = "/vehicles" + "/\(id)"
    }
    return path
  }
  
  var method: HTTPMethod {
    return .get
  }
  
  var parameters: [String: Any]? {
    return nil
  }
}

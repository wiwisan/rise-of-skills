//  Router.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Foundation
import Alamofire

enum Router {
  
  case films(id: Int?)
  case people(id: Int?)
  case planets(id: Int?)
  case species(id: Int?)
  case starships(id: Int?)
  case vehicles(id: Int?)
}

// MARK - Routing
extension Router: Routing {
  
  var baseURL: String {
    return "http://swapi.co/api"
  }
  
  var path: String {
    var path = ""
    switch self {
    case .films(let id):
      path = "/films" + "/\(String(describing: id))"
    case .people(let id):
      path = "/people" + "/\(String(describing: id))"
    case .planets(let id):
      path = "/planets" + "/\(String(describing: id))"
    case .species(let id):
      path = "/species" + "/\(String(describing: id))"
    case .starships(let id):
      path = "/starships" + "/\(String(describing: id))"
    case .vehicles(let id):
      path = "/vehicles" + "/\(String(describing: id))"
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

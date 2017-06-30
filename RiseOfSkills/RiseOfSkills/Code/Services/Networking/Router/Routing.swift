//  Routing.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Alamofire

protocol Routing {
  var baseURL: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var parameters: [String: Any]? { get }
}

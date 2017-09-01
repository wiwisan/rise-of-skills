//
//  FilmList+Realm.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import RealmSwift

extension FilmList {
  
  static func findAll() -> Results<FilmList> {
    guard let realm = try? Realm() else {
      fatalError("")
    }
    
    return realm.objects(FilmList.self)
  }
}

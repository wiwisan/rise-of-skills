//
//  CharacterList+Marshal.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import Foundation
import RealmSwift
import Marshal

extension CharacterList: Unmarshaling {
  
  convenience init(object: MarshaledObject) throws {
    self.init()
    
    self.count      = try object.value(for: "count")
    self.next       = try object.value(for: "next")
    self.previous   = try object.value(for: "previous")

    if let results: [Character] = try? object.value(for: "results") {
      self.results.append(objectsIn: results)
    }
  }
}

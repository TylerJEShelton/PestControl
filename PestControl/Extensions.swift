//
//  Extensions.swift
//  PestControl
//
//  Created by Tyler Shelton on 2017-08-19.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import SpriteKit

extension SKTexture {
  convenience init(pixelImageNamed: String) {
    self.init(imageNamed: pixelImageNamed)
    self.filteringMode = .nearest
  }
}

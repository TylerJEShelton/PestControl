//
//  Firebug.swift
//  PestControl
//
//  Created by Tyler Shelton on 2017-08-21.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import SpriteKit

class Firebug: Bug {
  
  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
  
  override init() {
    super.init()
    name = "Firebug"
    color = .red
    colorBlendFactor = 0.8
    physicsBody?.categoryBitMask = PhysicsCategory.Firebug
  }
}

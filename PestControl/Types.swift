//
//  Types.swift
//  PestControl
//
//  Created by Tyler Shelton on 2017-08-19.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

enum Direction: Int {
  case forward = 0, backward, left, right
}

typealias TileCoordinates = (column: Int, row: Int)

struct PhysicsCategory {
  static let None:      UInt32 = 0
  static let All:       UInt32 = 0xFFFFFFFF
  static let Edge:      UInt32 = 0b1
  static let Player:    UInt32 = 0b10
  static let Bug:       UInt32 = 0b100
  static let Firebug:   UInt32 = 0b1000
  static let Breakable: UInt32 = 0b10000
}

enum GameState: Int {
  case initial=0, start, play, win, lose, reload, pause, beatGame
}

//
//  HUD.swift
//  PestControl
//
//  Created by Tyler Shelton on 2017-08-23.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import SpriteKit

enum HUDSettings {
  static let font = "Noteworthy-Bold"
  static let fontSize: CGFloat = 50
}

enum HUDMessages {
  static let tapToStart = "Tap to Start"
  static let win = "You Win!"
  static let lose = "Out of Time!"
  static let nextLevel = "Tap for Next Level"
  static let playAgain = "Tap to Play Again"
  static let reload = "Continue Previous Game?"
  static let yes = "Yes"
  static let no = "No"
  static let beatGame1 = "CONGRATULATIONS!"
  static let beatGame2 = "YOU BEAT THE GAME!"
  static let tapToStartOver = "Tap to Start Over"
}
class HUD: SKNode {
  
  var timerLabel: SKLabelNode?
  
  override init() {
    super.init()
    name = "HUD"
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func add(message: String, position: CGPoint, fontSize: CGFloat = HUDSettings.fontSize) {
    
    let label: SKLabelNode
    label = SKLabelNode(fontNamed: HUDSettings.font)
    label.text = message
    label.name = message
    label.zPosition = 100
    addChild(label)
    label.fontSize = fontSize
    label.position = position
  }
  
  func updateTimer(time: Int) {
    let minutes = (time/60) % 60
    let seconds = time % 60
    let timeText = String(format: "%02d:%02d", minutes, seconds)
    timerLabel?.text = timeText
  }
  
  func addTimer(time: Int) {
    
    guard let scene = scene else { return }
    
    let position = CGPoint(x: 0, y: scene.frame.size.height/2 - 10)
    add(message: "Timer", position: position, fontSize: 24)
    
    timerLabel = childNode(withName: "Timer") as? SKLabelNode
    timerLabel?.verticalAlignmentMode = .top
    timerLabel?.fontName = "Menlo"
    updateTimer(time: time)
  }
  
  func updateGameState(from: GameState, to: GameState) {
    clearUI(gameState: from)
    updateUI(gameState: to)
  }
  
  private func updateUI(gameState: GameState) {
    switch gameState {
    case .start:
      add(message: HUDMessages.tapToStart, position: CGPoint(x:0, y: -25))
    case .win:
      add(message: HUDMessages.win, position: CGPoint(x:0, y: +25))
      add(message: HUDMessages.nextLevel, position: CGPoint(x:0, y: -75))
    case .lose:
      add(message: HUDMessages.lose, position: CGPoint(x:0, y: +25))
      add(message: HUDMessages.playAgain, position: CGPoint(x:0, y: -75))
    case .beatGame:
      add(message: HUDMessages.beatGame1, position: CGPoint(x:0, y: +75))
      add(message: HUDMessages.beatGame2, position: CGPoint(x:0, y: -25))
      add(message: HUDMessages.tapToStartOver, position: CGPoint(x:0, y: -125))
    case .reload:
      add(message: HUDMessages.reload, position: CGPoint(x: 0, y: +25))
      add(message: HUDMessages.yes, position: CGPoint(x: -140, y: -75))
      add(message: HUDMessages.no, position: CGPoint(x: 130, y: -75))
    default:
      break
    }
  }
  
  private func clearUI(gameState: GameState) {
    switch gameState {
    case .start:
      remove(message: HUDMessages.tapToStart)
    case .win:
      remove(message: HUDMessages.win)
      remove(message: HUDMessages.nextLevel)
    case .lose:
      remove(message: HUDMessages.lose)
      remove(message: HUDMessages.playAgain)
    case .beatGame:
      remove(message: HUDMessages.beatGame1)
      remove(message: HUDMessages.beatGame2)
      remove(message: HUDMessages.tapToStartOver)
    case .reload:
      remove(message: HUDMessages.reload)
      remove(message: HUDMessages.yes)
      remove(message: HUDMessages.no)
    default:
      break
    }
    
  }
  
  private func remove(message: String) {
    childNode(withName: message)?.removeFromParent()
  }
}

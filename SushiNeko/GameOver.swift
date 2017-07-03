//
//  GameOver.swift
//  SushiNeko
//
//  Created by Havi Nguyen on 6/27/17.
//  Copyright © 2017 Havi Nguyen. All rights reserved.
//

import SpriteKit

class GameOver: SKScene {
    
    var scoreGameOver: SKLabelNode!
    var buttonPlayAgain: MSButtonNode!
    
    override func didMove(to view: SKView) {
        scoreGameOver = childNode(withName: "scoreGameOver") as! SKLabelNode
        
        buttonPlayAgain = childNode(withName: "buttonPlayAgain") as! MSButtonNode
        
        buttonPlayAgain.selectedHandler = {
            self.loadGame()
            
        }
    }
    
    func loadGame() {
        /* 1) Grab reference to our SpriteKit view */
        guard let skView = self.view as SKView! else {
            print("Could not get Skview")
            return
        }
        
        /* 2) Load Game scene */
        guard let scene = GameScene(fileNamed:"GameScene") else {
            print("Could not make GameScene, check the name is spelled correctly")
            return
        }
        
        /* 3) Ensure correct aspect mode */
        scene.scaleMode = .aspectFill
        
        /* Show debug */
        skView.showsPhysics = true
        skView.showsDrawCount = true
        skView.showsFPS = true
        
        /* 4) Start game scene */
        skView.presentScene(scene)
    }
}

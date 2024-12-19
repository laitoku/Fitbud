//
//  Pet.swift
//  Fitbud
//
//  Created by Joshua Lai on 11/29/24.
//

import SpriteKit
import SwiftUI

class PetScene: SKScene {
    let pet = SKSpriteNode(imageNamed: "slimeb")
    let grass = SKSpriteNode(color: .green, size: CGSize(width: 200, height: 200))
    var moveInterval: TimeInterval = 3.0
    var x = true
    
    override func didMove(to view: SKView) {
        let slimeball = self.childNode(withName: "slimeball") as? SKSpriteNode
        let stage = UserDefaults.standard.integer(forKey: "PetStage")
        let bg = self.childNode(withName: "background") as? SKSpriteNode
        
        let gift = UserDefaults.standard.integer(forKey: "Gift")
        let gappear = SKAction.move(to: CGPoint(x: 0, y: 0), duration: 0.1)
        
        if gift > 0 {
            let ball = self.childNode(withName: "ball")
            ball!.run(gappear)
            if gift > 1 {
                let volleyball = self.childNode(withName: "volleyball")
                volleyball!.run(gappear)
                if gift > 2 {
                    let football = self.childNode(withName: "football")
                    football!.run(gappear)
                }
            }
        }

        if Calendar.current.component(.hour, from: Date()) > 19 {
            bg?.texture = SKTexture(imageNamed: "backgroundnight")
        } else {
            bg?.texture = SKTexture(imageNamed: "background")
        }
        
        if stage > 4 {
            if stage > 11 {
                slimeball?.texture = SKTexture(imageNamed: "slimeball3")
            } else {
                slimeball?.texture = SKTexture(imageNamed: "slimeball2")
            }
        }
        
        startRandomMovement()
        checkFood()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if let slimeball = self.childNode(withName: "slimeball") as? SKSpriteNode {
            if slimeball.contains(location) {
                makeSlimeballJump(slimeball)
            }
        }
        
        if let food = self.childNode(withName: "food") as? SKSpriteNode {
            if food.contains(location) {
                feedPet(food)
            }
        }
    }
    
    func makeSlimeballJump(_ slimeball: SKSpriteNode) {
        let jumpHeight: CGFloat = 150
        let jumpDuration: TimeInterval = 0.5

        let moveUp = SKAction.moveBy(x: 0, y: jumpHeight, duration: jumpDuration / 2)
        moveUp.timingMode = .easeOut

        slimeball.run(moveUp)
    }
    
    func checkFood() {
        DispatchQueue.main.asyncAfter(deadline: .now() + moveInterval) {
            let f = UserDefaults.standard.integer(forKey: "Food")

            if f > 0 && self.x {
                let food = self.childNode(withName: "food") as? SKSpriteNode

                food?.texture = SKTexture(imageNamed: "image\(f)")

                let appear = SKAction.move(to: CGPoint(x: 0, y: 0), duration: 0.1)
                food!.run(appear)
                self.x = false
            } else {
                self.checkFood()
            }
        }
    }
    
    func startRandomMovement() {
        DispatchQueue.main.asyncAfter(deadline: .now() + moveInterval) {
            let slimeball = self.childNode(withName: "slimeball") as? SKSpriteNode
            var randomX = CGFloat.random(in: -10...10)

            if slimeball!.position.x > 240 {
                randomX = CGFloat.random(in: -10...(-5))
            } else if slimeball!.position.x < -240 {
                randomX = CGFloat.random(in: 5...10)
            }
            
            let moveAction = SKAction.moveBy(x: randomX, y: 50, duration: 0.5)

            slimeball!.run(moveAction, completion: {
                self.startRandomMovement()
            })
        }
    }
    
    func feedPet(_ food: SKSpriteNode) {
        let slimeball = self.childNode(withName: "slimeball") as? SKSpriteNode
        let location = (slimeball?.position)!
        let feed = SKAction.move(to: location, duration: 0.1)
        let disappeaer = SKAction.move(to: CGPoint(x: 500, y: 500), duration: 0.00001)
        let slimeAction = SKAction.moveBy(x: 0, y: 50, duration: 0.5)
        
        food.run(feed)
        slimeball?.run(SKAction.sequence([slimeAction, slimeAction, slimeAction]), completion: {food.run(disappeaer)})
        x = true
        var stage = UserDefaults.standard.integer(forKey: "PetStage")
        stage += 1
        UserDefaults.standard.set(stage, forKey: "PetStage")
        UserDefaults.standard.set(0, forKey: "Food")
        
        if stage > 4 {
            if stage > 11 {
                slimeball?.texture = SKTexture(imageNamed: "slimeball3")
            } else {
                slimeball?.texture = SKTexture(imageNamed: "slimeball2")
            }
        }
    }
}

//
//  GameScene.swift
//  SpriteKitSimpleGame
//
//  Created by CraigGrummitt on 1/08/2014.
//  Copyright (c) 2014 CraigGrummitt. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var player = SKSpriteNode(imageNamed: "player")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        /*let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)*/
        println("Size: \(size.height),\(size.width)")
        self.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        self.player.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));//CGPointMake(100, 100)
        self.player.position = CGPointMake(self.player.size.width/2, CGRectGetMidY(self.frame))
        self.addChild(self.player)
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        println("Size: \(size.height),\(size.width)")
       /* for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }*/
    }
    func addMonster() {
        var monster = SKSpriteNode(imageNamed: "monster")
        var minY=monster.size.height/2
        var maxY = self.frame.size.height - monster.size.height/2
        var rangeY = maxY-minY
        
        var actualY = CGFloat(UInt(arc4random() % UInt32(UInt(rangeY))))+minY              //<------CRAZY RAND
        
        var minDuration = 2.0
        var maxDuration = 4.0
        var rangeDuration = maxDuration - minDuration
        var actualDuration =  Double(UInt(arc4random() % UInt32(rangeDuration)))+minDuration
        
        var actionMove = SKAction.moveTo(CGPointMake(-monster.size.width/2,actualY), duration: actualDuration)
        var actionMoveDone = SKAction.removeFromParent()
        monster.runAction(SKAction.sequence([actionMove,actionMoveDone]))

    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

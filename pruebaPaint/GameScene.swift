//
//  GameScene.swift
//  pruebaPaint
//
//  Created by Grace Montoya on 7/20/17.
//  Copyright © 2017 Grace Montoya. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var firstPoint:CGPoint = CGPoint(x: 0.0, y: 0.0)
    
    override func didMove(to view: SKView) {
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!.location(in: self)
        firstPoint = touch
       
        /*for t in touches {
            self.touchDown(atPoint: t.location(in: self))
            print(t.location(in:self))
        }*/
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let positionInScene = touches.first!.location(in: self)
        
        let lineNode = SKShapeNode() //for vector processing
        let pathToDraw = CGMutablePath() //makes a path
        
        pathToDraw.move(to: CGPoint(x:firstPoint.x, y:firstPoint.y))//where line will start
        pathToDraw.addLine(to: CGPoint(x:positionInScene.x, y:positionInScene.y))//where line ends
        lineNode.path = pathToDraw //draws the path
        lineNode.lineWidth = 2.0
        lineNode.strokeColor = UIColor.red
        lineNode.name = "line"
        
        self.addChild(lineNode)
        firstPoint = positionInScene
       
        /*for t in touches {
            self.touchMoved(toPoint: t.location(in: self))
            print(t.location(in:self))
        }*/
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        //comment if you dont want the lines to disappear after touches ended
        enumerateChildNodes(withName: "line", using: {node, stop in
            node.removeFromParent()
        })
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

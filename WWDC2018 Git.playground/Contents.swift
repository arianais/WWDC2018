/*: # Coding Colab
 - Note:
***This playground was made to help children with mild autism and ADHD with colaboration and organizational skills.***
 As many of these children have innate characteristics that make them natural-born coders, such as their ability to hyperfocus and see problems differently, coding is a natural medium to help these chidren with the difficulties they face.


## Let's get started!
 In this project, you both will be working together to uncover two secret pictures using your coding abilities. We are going to start by making sure we are all set up before we get to work.
*/:
 //: 1. Make sure you both have an avatar picture.
 //: 2. Decide who will be "Coder #1" and who will be "Coder #2"
 //: 3. Name Coder #1's picture `coder1.png` and Coder #2's picture `coder2.png`.
 //:  4. Delete the `coder1.png` and `coder2.png` images already in the `Resources` folder and add drag your new pictures in.
 //: 5. Create a new pen to draw with using  `Pen()`.
 //:
  //: ## Ready, set, Code!

//Coder 1: create a method that creates a rectangle with the right, left, down, and other methods. your method should take in a width and a height.
//the right side's length should be equal to the height, while top and bottom will be equal to the width
//explain to coder 2 what this method does and what variables the method can take in
//Coder 2: create two rectangles
//explain to coder 1 what the two rectangle's names are and which one was last drawn
//Coder 1: attach a circle to a triangle. then attach the circle to the rectangle that was last drawn
//Coder 2: create a method that draws a rectangle with a circle and a another rectangle inside of it
//explain to coder 1 how to use this method and what the method returns
//Coder 1: create a shape with coder 2's last method and attach it to the top rectangle
//coder 2: run the program!


//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {
    
    private var label : SKLabelNode!
    private var spinnyNode : SKShapeNode!
    
    override func didMove(to view: SKView) {
        // Get label node from scene and store it for use later
        label = childNode(withName: "//helloLabel") as? SKLabelNode
        label.alpha = 0.0
        let fadeInOut = SKAction.sequence([.fadeIn(withDuration: 2.0),
                                           .fadeOut(withDuration: 2.0)])
        label.run(.repeatForever(fadeInOut))
        
        // Create shape node to use during mouse interaction
        let w = (size.width + size.height) * 0.05
        
        spinnyNode = SKShapeNode(rectOf: CGSize(width: w, height: w), cornerRadius: w * 0.3)
        spinnyNode.lineWidth = 2.5
        
        let fadeAndRemove = SKAction.sequence([.wait(forDuration: 0.5),
                                               .fadeOut(withDuration: 0.5),
                                               .removeFromParent()])
        spinnyNode.run(.repeatForever(.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
        spinnyNode.run(fadeAndRemove)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        guard let n = spinnyNode.copy() as? SKShapeNode else { return }
        
        n.position = pos
        n.strokeColor = SKColor.green
        addChild(n)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        guard let n = self.spinnyNode.copy() as? SKShapeNode else { return }
        
        n.position = pos
        n.strokeColor = SKColor.blue
        addChild(n)
    }
    
    func touchUp(atPoint pos : CGPoint) {
        guard let n = spinnyNode.copy() as? SKShapeNode else { return }
        
        n.position = pos
        n.strokeColor = SKColor.red
        addChild(n)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

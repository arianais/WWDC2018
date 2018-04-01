//  Welcome to the brains of the UI. You do not want to edit this file. Back away slowly and no harm will come to your playground :).
//
//
//  Created by Ariana Isabel Sokolov on 3/20/18.
//  Copyright © 2017 Logical Nonsense, LLC. All rights reserved.


import SpriteKit
import PlaygroundSupport
public class UI {
    //MARK: Narrative Initalization
    public var names:[String]
    public enum Coder: String {
        case pilot = "Pilot"
        case navigator = "Navigator"
    }
    var narrative: [(Coder, String)] = [(.pilot, "Starting up the rocket's engine...."), (.pilot, "Setting up the control system...."), (.pilot, "Adding my planet into the system...."), (.pilot, "Getting the rocket's current position..."), (.navigator, "Connecting to the rocket's navigation system..."), (.navigator, "Setting the route's starting and ending points..."), (.navigator, "Setting the route's first stop..."),  (.navigator, "Setting the route's second stop..."),  (.navigator, "Downloading directions from the navigation system..."), (.pilot, "Getting directions from the navigation system..."), (.pilot, "Starting directions from the navigation system..."),  (.pilot, "Blasting off!")]
    //MARK: View Initalization
    let background = UIColor(red: (34.0/255.0), green: (33.0/255.0), blue: (58.0/255.0), alpha: 1.0)
    var buttonNode = SKNode()
    var errorNode = SKSpriteNode(texture: SKTexture(imageNamed: "Images/error"))
    let view = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 369))
    var scene = 1
    //MARK: Basic Nodes Initalization
    let content = SKNode()
    let rocket = SKSpriteNode(texture: SKTexture(imageNamed: "Images/rocket"))
    let stars = SKSpriteNode(texture: SKTexture(imageNamed: "Images/stars"))
    //MARK: Planet Nodes Initalization
    let earth = SKSpriteNode(texture: SKTexture(imageNamed: "Images/earth"))
    let purpleplanet = SKSpriteNode(texture: SKTexture(imageNamed: "Images/purpleplanet"))
    let grayplanet = SKSpriteNode(texture: SKTexture(imageNamed: "Images/grayplanet"))
    var planetTitle = SKLabelNode()
    //MARK: Extra Nodes Initalization
    let alien1 = SKSpriteNode(texture: SKTexture(imageNamed: "Images/aliens/alien0"))
    let alien2 = SKSpriteNode(texture: SKTexture(imageNamed: "Images/aliens/alien0"))
    let alien3 = SKSpriteNode(texture: SKTexture(imageNamed: "Images/aliens/alien0"))
    var commet = SKSpriteNode(texture: SKTexture(imageNamed: "Images/commets/commet0") )
    let commmetPath = SKShapeNode(circleOfRadius: 1000)
    //MARK: User Nodes Initalizaton
    var speach = SKSpriteNode()
    var text = SKLabelNode()
    var name = SKLabelNode()
    var navigator = SKSpriteNode()
    var pilot = SKSpriteNode()
    var images: [UIImage] = []
    //MARK: Init
    public init(_ names: [String]){
        self.names = names
        PlaygroundPage.current.liveView = view
        let scene = SKScene(size: CGSize(width: 512, height: 369))
        scene.scaleMode = .aspectFit
        scene.backgroundColor = background
        view.presentScene(scene)
        content.position = CGPoint(x: 0, y: 0)
        scene.addChild(content)
        DispatchQueue.main.async {
            let cam = Camera()
            cam.retrieveImages({ (images) in
                self.images = images
                DispatchQueue.main.async {
                    self.team()
                }
            })
        }
    }
    //MARK: Button Utils
    //next: preforms button segues
    @objc func next(){
        switch scene {
        case 0:
            DispatchQueue.main.async{
                self.navigator.run(self.fadeOut(self.navigator))
            }
            DispatchQueue.main.async{
                self.pilot.run(self.fadeOut(self.pilot))
            }
            DispatchQueue.main.async{
                self.createError()
                let change = SKAction.run {
                    self.errorNode.setScale(1/2)
                    self.errorNode.position = CGPoint(x: 175, y: 20)
                    self.speach.addChild(self.errorNode)
                }
                let errorIn = SKAction.run {
                    self.errorNode.run(self.fadeIn(self.errorNode))
                }
                let sequence = SKAction.sequence([self.fadeOut(self.buttonNode), change, errorIn])
                self.buttonNode.run(sequence)
            }
            self.scene = 1
        case 1:
            DispatchQueue.main.async {
                self.scene1()
            }
            self.scene = 2
        case 2:
            if(narrative.count > 0){
                switch narrative[0].0 {
                case .navigator:
                    
                    self.pilot.run(SKAction.fadeAlpha(to: 0.25, duration: 0.5))
                    self.reAdd( self.navigator)
                    self.name.text = "\(names[0]) (Navigator)"
                default:
                    self.navigator.run(SKAction.fadeAlpha(to: 0.25, duration: 0.5))
                    self.reAdd(self.pilot)
                    self.name.text = "\(names[1]) (Pilot)"
                }
                self.text.text = narrative[0].1
                self.narrative.remove(at: 0)
            } else {
                self.scene = 3
                next()
                
            }
            if(self.narrative.count == 0 && self.scene == 2){
                DispatchQueue.main.async{
                    let sound = SKAction.playSoundFileNamed("Sounds/takeOff.m4a", waitForCompletion: false)
                    self.content.run(sound)
                }
                DispatchQueue.main.async{
                    self.rocket.run(SKAction.moveTo(y: 165, duration: 2.0))
                }
                DispatchQueue.main.async {
                    self.buttonNode.position = CGPoint(x: 457, y: 325)
                    self.removeButton(1.5)
                }
                DispatchQueue.main.async {
                    self.speach.run(self.fadeOut(self.speach))
                }
                DispatchQueue.main.async{
                    self.navigator.run(SKAction.fadeOut(withDuration: 1.0))
                }
                DispatchQueue.main.async {
                    self.pilot.run(SKAction.fadeOut(withDuration: 1.0))
                }
            }
        case 3:
            DispatchQueue.main.async {
                self.scene2()
            }
            
            DispatchQueue.main.async {
                self.moveStars(count: 0)
            }
            DispatchQueue.main.async {
                self.moveOutPlanet(oldPlanet: self.earth, newPlanet: self.purpleplanet)
            }
            DispatchQueue.main.async {
                self.animateAliens()
            }
            DispatchQueue.main.async{
                self.removeButton(23.0)
            }
            self.scene = 4
        case 4:
            DispatchQueue.main.async {
                self.scene3()
            }
            DispatchQueue.main.async {
                self.moveStars(count: 1)
            }
            DispatchQueue.main.async{
                self.navigator.run(self.fadeOut(self.navigator))
            }
            DispatchQueue.main.async{
                self.planetTitle.run(SKAction.fadeOut(withDuration: 1.0))
            }
            DispatchQueue.main.async {
                self.moveOutPlanet(oldPlanet: self.purpleplanet, newPlanet: self.grayplanet)
            }
            DispatchQueue.main.async {
                self.animateCommet()
            }
            DispatchQueue.main.async{
                self.removeButton(32.0)
            }
            self.scene = 5
        case 5:
            DispatchQueue.main.async {
                self.buttonNode.run(self.fadeOut(self.buttonNode))
            }
            DispatchQueue.main.async{
                self.pilot.run(self.fadeOut(self.pilot))
            }
            DispatchQueue.main.async{
                self.planetTitle.run(SKAction.fadeOut(withDuration: 1.0))
            }
            DispatchQueue.main.async {
                self.rocket.run(self.fadeOut(self.rocket))
            }
            DispatchQueue.main.async {
                self.grayplanet.run(self.fadeOut(self.grayplanet))
            }
            DispatchQueue.main.async{
                self.commet.run(self.fadeOut(self.commet))
            }
            DispatchQueue.main.async {
                self.end()
            }
            self.scene = 5
        default:
            self.scene = 5
        }
    }
    //Remove Button: removes button from screen then re-adds on top
    func removeButton(_ time: Double){
        let wait = SKAction.wait(forDuration: time)
        let change = SKAction.run {
            self.content.addChild(self.buttonNode)
        }
        let sequence = SKAction.sequence([ self.fadeOut(self.buttonNode), change, wait, self.fadeIn(self.buttonNode)])
        self.buttonNode.run(sequence)
    }
    //MARK: General Animation
    //Fade In: fades a node into the scene
    func fadeIn(_ node: SKNode) -> SKAction{
        node.alpha = 0.0
        let sequence = SKAction.sequence([SKAction.fadeIn(withDuration: 1.0)])
        return sequence
    }
    //Fade Out: fades a node out of the scene and removes it
    func fadeOut(_ node: SKNode) -> SKAction{
        let remove = SKAction.run {
            node.removeFromParent()
        }
        let sequence = SKAction.sequence([SKAction.fadeOut(withDuration: 1.0), remove])
        return sequence
    }
    //MARK: Scene Animation
    //Move Stars: creates moving animation between planets
    func moveStars(count: Int){
        var sound = SKAction()
        if(count == 0){
            sound = SKAction.playSoundFileNamed("Sounds/starWars.m4a", waitForCompletion: false)
        }
        else{
            sound = SKAction.playSoundFileNamed("Sounds/starTreck.m4a", waitForCompletion: false)
        }
        let sprite = self.stars
        let fadeIn = SKAction.moveBy(x: -492, y: 0, duration: 10.0)
        let fadeOut = SKAction.run {
            self.stars.position = CGPoint(x: 490, y: 175)
        }
        let seq01 = SKAction.sequence([ fadeIn, fadeOut])
        self.content.run(sound)
        sprite.run(seq01)
    }
    //Animate Aliens: animates alien planet page
    func animateAliens(){
        let wait = SKAction.wait(forDuration: 10.0)
        DispatchQueue.main.async{
            let order = [0,1,2,2,2,3,3,3,3,3,4,5,6,6,6,7,8,8,8,8,8,8,8,8,8,9,10,11,12,13,14,15,16,17,18,19,19,19,19,19,19,20,21,22,22,22,23,24,25,25,25,26,26,26,26,26,27,27,27,27,27,28,27,29,28,27,29,28,27,29,27]
            
            var textures: [SKTexture] = []
            let sound = SKAction.playSoundFileNamed("Sounds/minions.m4a", waitForCompletion: false)
            
            for e in order {
                textures.append(SKTexture(imageNamed: "Images/aliens/alien\(e)"))
            }
            
            let animate = SKAction.animate(with: textures, timePerFrame: (0.2))
            self.content.run(SKAction.sequence([wait, sound]))
            self.alien1.run(SKAction.sequence([wait, animate]))
            self.alien2.run(SKAction.sequence([wait, animate]))
            self.alien3.run(SKAction.sequence([wait, animate]))
        }
        
        
        DispatchQueue.main.async{
            self.planetLabel( self.names[2], .navigator, wait)
        }
    }
    //ANIMATE COMMET: commet planet page animation
    func animateCommet(){
        let wait = SKAction.wait(forDuration: 10.0)
        DispatchQueue.main.async {
            let path = UIBezierPath()
            path.move(to: CGPoint(x:550, y:275))
            path.addCurve(to: CGPoint(x:-50, y:200), controlPoint1: CGPoint(x:300, y:325), controlPoint2: CGPoint(x:200, y:325))
            let sound = SKAction.playSoundFileNamed("Sounds/spaceOdessey.m4a", waitForCompletion: false)
            let circle = SKAction.follow( path.cgPath, asOffset: false, orientToPath: true, duration: 3.0)
            let wait = SKAction.wait(forDuration: 10.0)
            let order = [1,2,3,4,5,6,7]
            var movement = [wait, circle]
            for e in order {
                let change =  SKAction.run {
                    self.commet.texture = SKTexture(imageNamed: "Images/commets/commet\(e)")
                }
                movement.append(change)
                movement.append(circle)
            }
            self.commet.run( SKAction.sequence(movement))
            self.content.run(SKAction.sequence([wait, sound]))
        }
        DispatchQueue.main.async {
            self.planetLabel(self.names[3], .pilot, wait)
        }
    }
    //Move Out Planet: planet segue animation
    func moveOutPlanet(oldPlanet: SKSpriteNode?, newPlanet: SKSpriteNode?){
        if let planet = oldPlanet{
            planet.run(SKAction.moveTo(x: -400, duration: 4.0))
        }
        if let planet = newPlanet{
            planet.run( SKAction.sequence([SKAction.wait(forDuration: 6.0), SKAction.moveTo(x: 250, duration: 4.0) ]))
        }
    }
    //Re-Add: re adds avatars to be on top of the view
    func reAdd( _ node: SKSpriteNode){
        
        let add = SKAction.run {
            
            self.content.addChild(node)
        }
        node.run(SKAction.sequence( [self.fadeOut(node), add, SKAction.fadeIn(withDuration: 1.0)]))
    }
    //MARK: Scene Setup
    //Basic: adds stars and a button to the scene
    func basic(){
        DispatchQueue.main.async {
            self.stars.setScale(1/2)
            self.stars.position = CGPoint(x: 490, y:175)
            self.content.addChild(self.stars)
        }
        DispatchQueue.main.async {
            self.buttonNode = SKButtonNode(texture: SKTexture(imageNamed: "Images/button")) {
                self.next()
            }
            self.buttonNode.setScale(1/2)
            self.buttonNode.position = CGPoint(x: 475, y: 330)
            self.buttonNode.run(self.fadeIn(self.buttonNode))
            self.content.addChild(self.buttonNode)
        }
    }
    //Team: Adds begining team page
    func team(){
        DispatchQueue.main.async {
            self.basic()
        }
        DispatchQueue.main.async {
            self.addAvatars("", pos1: CGPoint(x: 140, y: 185), pos2: CGPoint(x: (512-140), y: 185))
        }
        DispatchQueue.main.async {
            self.navigator.addChild(self.bigLb("Navigator"))
        }
        DispatchQueue.main.async {
            self.pilot.addChild(self.bigLb("Pilot"))
        }
    }
    //Add Error: adds error page with step number of error incident and coder responsible
    public func addError(step: Int, coder: Coder){
        DispatchQueue.main.async{
            self.buttonNode.run(self.fadeIn(self.buttonNode))
        }
        DispatchQueue.main.async{
            if(step <= 1){
                self.text.text = "Uh oh! \(coder.rawValue), take a look at step \(step)."
            } else {
                self.text.text = "Uh oh! \(coder.rawValue), take a look at step \(step) or the step before."
                
            }
        }
        self.scene = 0
    }
    //Scene 1: sets up scene 1
    func scene1(){
        DispatchQueue.main.async {
            self.earth.setScale(1/2)
            self.earth.position = CGPoint(x: 400, y: 20)
            self.content.addChild(self.earth)
            self.earth.run(self.fadeIn(self.earth))
        }
        DispatchQueue.main.async {
            self.rocket.setScale(1/2)
            self.rocket.position = CGPoint(x: 150, y: -110)
            self.content.addChild(self.rocket)
        }
        DispatchQueue.main.async{
            self.addSmallNav(0.25)
            self.addSmallPilot(1.0)
        }
    }
    //Scene 2: sets up scene 1
    func scene2(){
        DispatchQueue.main.async {
            self.purpleplanet.setScale(1/2)
            self.purpleplanet.position = CGPoint(x: 1200, y: 20)
            self.content.addChild(self.purpleplanet)
        }
        DispatchQueue.main.async {
            self.alien1.setScale(1)
            self.alien1.position = CGPoint(x: -75, y: 100)
            self.purpleplanet.addChild(self.alien1)
        }
        DispatchQueue.main.async {
            self.alien2.setScale(1)
            self.alien2.position = CGPoint(x: 75, y: 100)
            self.purpleplanet.addChild(self.alien2)
        }
        DispatchQueue.main.async {
            self.alien3.setScale(1)
            self.alien3.position = CGPoint(x: 225, y: 100)
            self.purpleplanet.addChild(self.alien3)
        }
    }
    //Scene 3: sets up scene 3
    func scene3(){
        DispatchQueue.main.async {
            self.commmetPath.fillColor = .clear
            self.commmetPath.strokeColor = .clear
            
            self.commmetPath.position = CGPoint(x: 300, y: -700)
            self.content.addChild(self.commmetPath)
        }
        DispatchQueue.main.async {
            self.grayplanet.setScale(1/2)
            self.grayplanet.position = CGPoint(x: 1200, y: 20)
            self.content.addChild(self.grayplanet)
        }
        DispatchQueue.main.async {
            self.commet.setScale(1/2)
            self.commet.position = CGPoint(x: 300, y: -50)
            self.content.addChild(self.commet)
        }
    }
    //End: sets up ending scene
    func end(){
        let lb = self.bigLb("Amazing teamwork!👏")
        lb.position = CGPoint(x: 256, y:185 )
        lb.fontSize = 35
        self.content.addChild(lb)
        lb.run(self.fadeIn(lb))
    }
    //MARK: Text Node Generation
    //Create Speach: creates & adds a speach bubble node
    func createSpeach(){
        DispatchQueue.main.async{
            self.createBubble("\(self.names[1]) (Pilot)", CGPoint(x: 300, y: 310))
            self.text.text = self.narrative[0].1
        }
    }
    //Create Error: creates & adds an error bubble node
    func createError(){
        DispatchQueue.main.async{
            let pos = CGPoint(x: 256, y: 185)
            self.createBubble("Mission Control", pos)
        }
    }
    //Create Bubble: creates & adds a bubble node
    func createBubble(_ name: String, _ pos: CGPoint){
        DispatchQueue.main.async {
            let bubble = SKSpriteNode(texture: SKTexture(imageNamed: "Images/bubble"))
            bubble.setScale(1/2)
            self.speach.addChild(bubble)
        }
        DispatchQueue.main.async {
            self.text.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            self.text.position = CGPoint(x: -175, y: -15)
            self.text.fontSize = 14.0
            self.text.fontName = UIFont.systemFont(ofSize: 14.0, weight: .regular).fontName
            self.text.fontColor = .black
            self.speach.addChild(self.text)
            self.narrative.remove(at: 0)
        }
        DispatchQueue.main.async {
            self.name = SKLabelNode(text: name)
            self.name.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            self.name.position = CGPoint(x: -175, y: 5)
            self.name.fontSize = 14.0
            self.name.fontName = UIFont.systemFont(ofSize: 14.0, weight: .bold).fontName
            self.name.fontColor = .black
            self.speach.addChild(self.name)
        }
        DispatchQueue.main.async {
            self.speach.position = pos
            self.content.addChild(self.speach)
            self.speach.run(self.fadeIn(self.speach))
        }
    }
    //big lb: creates a large label to add to the view
    func bigLb(_ text: String) -> SKLabelNode{
        let label = SKLabelNode(text: text)
        label.fontName = UIFont.systemFont(ofSize: 1.0, weight: .heavy).fontName
        label.fontColor = .white
        label.fontSize = 25.0
        label.position = CGPoint(x: label.position.x, y: -130)
        return label
    }
    //planet label: adds planet name & owner pic to screen
    func planetLabel(_ name: String, _ coder: Coder, _ wait: SKAction) {
        
        DispatchQueue.main.async{
            self.planetTitle = self.bigLb("\(name)")
            self.planetTitle.fontName = UIFont.systemFont(ofSize: 1.0, weight: .bold).fontName
            // self.planetTitle.fontSize = 14.0
            self.planetTitle.position = CGPoint(x: (self.planetTitle.frame.width * 0.5) + 85, y: 315)
            self.planetTitle.alpha = 0.0
            self.content.addChild(self.planetTitle)
            let sequence = [wait, SKAction.fadeIn(withDuration: 1.0)]
            self.planetTitle.run(SKAction.sequence(sequence))
        }
        DispatchQueue.main.async{
            var node = SKSpriteNode()
            switch coder {
            case .navigator:
                node = self.navigator
            default:
                node = self.pilot
            }
            node.alpha = 0.0
            let run = SKAction.run {
                node.position = CGPoint(x: 50, y: 325)
            }
            let sequence = [wait, run, SKAction.fadeIn(withDuration: 1.0)]
            node.run(SKAction.sequence(sequence))
        }
    }
    //MARK: Avatar Generation
    //Add Avatars: adds and creates full-sized avatars for the view
    func addAvatars(_ ex: String, pos1: CGPoint, pos2: CGPoint){
        let path = "Images/astronaut" + ex
        DispatchQueue.main.async {
            DispatchQueue.main.async {
                let pic = SKSpriteNode(texture: SKTexture(imageNamed: path))
                pic.setScale(1/2)
                let face = SKSpriteNode(texture: SKTexture(image: self.images[1]))
                face.setScale(((pic.texture?.size().width)! * 0.15)/(face.texture?.size().width)!)
                face.position = CGPoint(x: face.position.x, y:      ((pic.texture?.size().height)! * 0.1))
                self.navigator.addChild(face)
                self.navigator.addChild(pic)
                self.navigator.position = pos1
                self.content.addChild(self.navigator)
                self.navigator.run(self.fadeIn(self.navigator))
            }
            DispatchQueue.main.async {
                let pic = SKSpriteNode(texture: SKTexture(imageNamed: path))
                pic.setScale(1/2)
                let face = SKSpriteNode(texture: SKTexture(image:  self.images[0]))
                face.setScale(((pic.texture?.size().width)! * 0.15)/(face.texture?.size().width)!)
                face.position = CGPoint(x: face.position.x, y:      ((pic.texture?.size().height)! * 0.1))
                self.pilot.addChild(face)
                self.pilot.addChild(pic)
                self.pilot.position = pos2
                self.content.addChild(self.pilot)
                self.pilot.run(self.fadeIn(self.pilot))
            }
        }
    }
    //Add Small Nav: creates and adds a small navigator avatar to the view
    func addSmallNav(_ alpha: CGFloat){
        DispatchQueue.main.async {
            let add = SKAction.run{
                self.navigator.removeAllChildren()
                let pic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/astronautsm"))
                self.navigator.setScale(1/2)
                self.navigator.position = CGPoint(x: 75, y: 310)
                let face = SKSpriteNode(texture: SKTexture(image:  self.images[1]))
                face.setScale(((pic.texture?.size().width)! * 0.3)/(face.texture?.size().width)!)
                face.position = CGPoint(x: face.position.x, y:      ((pic.texture?.size().height)! * 0.2))
                // self.navigator.alpha = alpha
                self.navigator.addChild(face)
                self.navigator.addChild(pic)
                self.content.addChild(self.navigator)
            }
            self.navigator.run(SKAction.sequence( [self.fadeOut(self.navigator), add, SKAction.fadeAlpha(to: alpha, duration: 1.0)]))
        }
    }
    //Add Small Pilot: creates and adds a small pilot avatar to the view
    func addSmallPilot(_ alpha: CGFloat){
        DispatchQueue.main.async {
            let add = SKAction.run{
                self.pilot.removeAllChildren()
                let pic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/astronautsm"))
                self.pilot.setScale(1/2)
                self.pilot.position = CGPoint(x: 50, y: 310)
                let face = SKSpriteNode(texture: SKTexture(image:  self.images[0]))
                face.setScale(((pic.texture?.size().width)! * 0.3)/(face.texture?.size().width)!)
                face.position = CGPoint(x: face.position.x, y:      ((pic.texture?.size().height)! * 0.2))
                //self.pilot.alpha = alpha
                self.pilot.addChild(face)
                self.pilot.addChild(pic)
                self.content.addChild(self.pilot)
                
            }
            self.pilot.run(SKAction.sequence( [self.fadeOut(self.pilot), add, SKAction.fadeAlpha(to: alpha, duration: 1.0)]))
        }
        DispatchQueue.main.async {
            self.createSpeach()
            self.removeButton(0.0)
        }
    }
}



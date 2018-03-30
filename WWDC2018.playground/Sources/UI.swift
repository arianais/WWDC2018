////Welcome to the brains of the UI. You do not want to edit this file. Back away slowly and no harm will come :P.

import SpriteKit
import XCPlayground

public class UI {
    let background = UIColor(red: (34.0/255.0), green: (33.0/255.0), blue: (58.0/255.0), alpha: 1.0)
    
    //MARK: Nodes
    let content = SKNode()
    let rocket = SKSpriteNode(texture: SKTexture(imageNamed: "Images/rocket"))
    let stars = SKSpriteNode(texture: SKTexture(imageNamed: "Images/stars"))
    //MARK: Planet Nodes
    let earth = SKSpriteNode(texture: SKTexture(imageNamed: "Images/earth"))
    let purpleplanet = SKSpriteNode(texture: SKTexture(imageNamed: "Images/purpleplanet"))
    let grayplanet = SKSpriteNode(texture: SKTexture(imageNamed: "Images/grayplanet"))
    
    //MARK: Extra Nodes
    let alien1 = SKSpriteNode(texture: SKTexture(imageNamed: "Images/aliens/alien0"))
    let alien2 = SKSpriteNode(texture: SKTexture(imageNamed: "Images/aliens/alien0"))
    let alien3 = SKSpriteNode(texture: SKTexture(imageNamed: "Images/aliens/alien0"))
    var commet = SKSpriteNode(texture: SKTexture(imageNamed: "Images/commets/commet0") )
    let commmetPath = SKShapeNode(circleOfRadius: 1000)
    
    //MARK: User Nodes
    var speach = SKSpriteNode()
    var text = SKLabelNode()
    var name = SKLabelNode()
    var navigator = SKSpriteNode()
    var pilot = SKSpriteNode()
    
    
    //MARK: View Stuff
    var buttonNode = SKNode()
    var errorNode = SKSpriteNode(texture: SKTexture(imageNamed: "Images/error"))
    let view = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 369))
    var scene = 1
    
    //MARK: Narrative
    public var names:[String] 
    public enum Speaker: String {
        case pilot = "Pilot"
        case navigator = "Navigator"
    }
    var narrative: [(Speaker, String)] = [(.pilot, "Starting up the rocket's engine...."), (.pilot, "Getting the rocket's current position..."), (.navigator, "Connecting to the rocket's navigation system..."), (.navigator, "Setting the route's starting and ending points..."), (.navigator, "Setting the route's first stop..."),  (.navigator, "Setting the route's second stop..."),  (.navigator, "Downloading directions from the navigation system..."), (.pilot, "Starting directions from the navigation system..."),  (.pilot, "Blasting off!")]
    
    var images: [UIImage] = []
    public init(_ names: [String]){
        self.names = names
        XCPlaygroundPage.currentPage.liveView = view
        
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
    func test(){
        let blueBox = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 150, height: 150))
        blueBox.position = CGPoint(x: 30, y: 0)
        content.addChild(blueBox)
        let redBox = SKSpriteNode(color: SKColor.red, size: CGSize(width: 150, height: 150))
        content.position = CGPoint(x: 150, y: 0)
        content.addChild(redBox)
        
    }
    
    @objc func next(){
        print("hello")
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
                //self.button.isHidden = true
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
                    self.name.text = "\(names[0]) (Navigator)"//add name
                    reAdd(0.25, self.pilot)
                    reAdd(1.0, self.navigator)
                default:
                    self.name.text = "\(names[1]) (Pilot)"//add name
                   
                    reAdd(0.25, self.navigator)
                     reAdd(1.0, self.pilot)
                }
                self.text.text = narrative[0].1
                self.narrative.remove(at: 0)
            }
            else{
                self.scene = 3
                next()
            }
            if(self.narrative.count == 0){
                let sound = SKAction.playSoundFileNamed("Sounds/takeOff.m4a", waitForCompletion: false)
                self.content.run(sound)
                self.rocket.run(SKAction.moveTo(y: 165, duration: 2.0))
            }
            
        case 3:
            DispatchQueue.main.async {
                self.scene2()
            }
            DispatchQueue.main.async {
                self.speach.isHidden = true
                self.navigator.isHidden = true
                self.pilot.isHidden = true
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
            DispatchQueue.main.async {
                self.moveOutPlanet(oldPlanet: self.purpleplanet, newPlanet: self.grayplanet)
            }
            DispatchQueue.main.async {
                self.animateCommet()
            }
            self.scene = 5
        case 5:
            DispatchQueue.main.async {
                self.buttonNode.run(self.fadeOut(self.buttonNode))
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
    //MARK: Animation
    func reAdd(_ alpha: CGFloat, _ node: SKSpriteNode){
        
        let add = SKAction.run {
            node.children[0].alpha = alpha
            node.children[1].alpha = alpha
            self.content.addChild(node)
        }
        node.run(SKAction.sequence( [self.fadeOut(node), add, SKAction.fadeIn(withDuration: 1.0)]))
    }
    func animateCommet(){
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
        //   let movementSequence = SKAction.sequence(movement)
        // let fadeSequence = SKAction.sequence(fade)
        
        commet.run( SKAction.sequence(movement))
         self.content.run(SKAction.sequence([wait, sound]))
        
        //commet.run(SKAction.group([movementSequence, fadeSequence]))
    }
    func createHalfCricle(){
        let line2 = UIBezierPath()
        line2.move(to: CGPoint(x:550, y:275))
        line2.addCurve(to: CGPoint(x:0, y:200), controlPoint1: CGPoint(x:300, y:325), controlPoint2: CGPoint(x:200, y:325))
        line2.miterLimit = 4
        line2.lineCapStyle = .round
        // make it dashed
        let line2Dashed = SKShapeNode(path: line2.cgPath.copy(dashingWithPhase: 2, lengths: [4, 4]))
        content.addChild(line2Dashed)
        
        // add the last straight line
        let line3 = UIBezierPath()
        line3.move(to: CGPoint(x:300, y:25))
        line3.addLine(to: CGPoint(x:375, y:25))
        
    }
    func animateAliens(){
        let order = [0,1,2,2,2,3,3,3,3,3,4,5,6,6,6,7,8,8,8,8,8,8,8,8,8,9,10,11,12,13,14,15,16,17,18,19,19,19,19,19,19,20,21,22,22,22,23,24,25,25,25,26,26,26,26,26,27,27,27,27,27,28,27,29,28,27,29,28,27,29,27]
        var textures: [SKTexture] = []
        let sound = SKAction.playSoundFileNamed("Sounds/walle.m4a", waitForCompletion: false)
        for e in order {
            textures.append(SKTexture(imageNamed: "Images/aliens/alien\(e)"))
        }
        let animate = SKAction.animate(with: textures, timePerFrame: (0.2))
        let wait = SKAction.wait(forDuration: 10.0)
        self.content.run(SKAction.sequence([wait, sound]))
        alien1.run(SKAction.sequence([wait, animate]))
        alien2.run(SKAction.sequence([wait, animate]))
        alien3.run(SKAction.sequence([wait, animate]))
        
    }
    func moveStars(count: Int){
//        let star = SKSpriteNode(texture: SKTexture(imageNamed: "Images/stars"))
//        star.setScale(1/2)
//        star.position = CGPoint(x: 490, y:175)
//        star.alpha = 0.0
//        self.content.addChild(star)
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
    func removeButton(_ time: Double){
        let wait = SKAction.wait(forDuration: time)
        let change = SKAction.run {
            self.content.addChild(self.buttonNode)
        }
        let sequence = SKAction.sequence([ self.fadeOut(self.buttonNode), change, wait, self.fadeIn(self.buttonNode)])
        self.buttonNode.run(sequence)
    }
    func moveOutPlanet(oldPlanet: SKSpriteNode?, newPlanet: SKSpriteNode?){
        
        if let planet = oldPlanet{
            
            planet.run(SKAction.moveTo(x: -400, duration: 4.0))
            
        }
        if let planet = newPlanet{
            planet.run( SKAction.sequence([SKAction.wait(forDuration: 6.0), SKAction.moveTo(x: 250, duration: 4.0) ]))
        }
        
        
    }
    //MARK: Scene Setup Functions
    func basic(){
        
        DispatchQueue.main.async {
         
            self.stars.setScale(1/2)
            self.stars.position = CGPoint(x: 490, y:175)
            self.content.addChild(self.stars)
        }
        
      
        DispatchQueue.main.async {
            
            self.buttonNode = SKButtonNode(texture: SKTexture(imageNamed: "Images/button")) {
                print("Button 1 pressed!")
                self.next()
            }
            //button1.setTitle("Example 1")
            //button1.position = CGPoint(x: 475, y: 330)
         
           // button.setScale(1/2)
            self.buttonNode.position = CGPoint(x: 475, y: 330)
           // self.buttonNode.alpha = 0.0
            //self.content.addChild(self.buttonNode)
            self.buttonNode.run(self.fadeIn(self.buttonNode))
      
           
            self.content.addChild(self.buttonNode)
//            self.button.backgroundColor = .red
//            self.button.addTarget(self, action: #selector(self.next), for: UIControlEvents.touchUpInside)
//            self.view.addSubview(self.button)

        }
    }
    func team(){
        DispatchQueue.main.async {
            self.basic()
        }
        //        DispatchQueue.main.async {
        //            let star = SKSpriteNode(texture: SKTexture(imageNamed: "Images/stars"))
        //            star.setScale(1/2)
        //            star.position = CGPoint(x: 250, y:175)
        //            self.stars.addChild(star)
        //            self.content.addChild(self.stars)
        //        }
        DispatchQueue.main.async {
            
            self.addAvatars("", pos1: CGPoint(x: 140, y: 185), pos2: CGPoint(x: (512-140), y: 185))
            //            let pic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/astronaut"))
            //            pic.setScale(1/5)
            //            self.navigator.addChild(pic)
            //            self.navigator.position = CGPoint(x: 150, y: 200)
            //
            //            self.content.addChild(self.navigator)
        }
        DispatchQueue.main.async {
            self.navigator.addChild(self.bigLb("Navigator"))
        }
        DispatchQueue.main.async {
            self.pilot.addChild(self.bigLb("Pilot"))
        }
    }
    func end(){
        print("hehlloooo")
        let lb = self.bigLb("Amazing teamwork!👏")
        lb.position = CGPoint(x: 256, y:185 )
        lb.fontSize = 35
        self.content.addChild(lb)
        lb.run(self.fadeIn(lb))
//        let emoji = self.bigLb("👏")
//        emoji.position = CGPoint(x: 256, y:185 )
//        self.content.addChild(emoji)
        
        DispatchQueue.main.async {
            
        //   self.addAvatars("", pos1: CGPoint(x: 140, y: 185), pos2: CGPoint(x: (512-140), y: 185))
           
            //            let pic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/astronaut"))
            //            pic.setScale(1/5)
            //            self.navigator.addChild(pic)
            //            self.navigator.position = CGPoint(x: 150, y: 200)
            //
            //            self.content.addChild(self.navigator)
        }
        DispatchQueue.main.async {
            //self.navigator.addChild(self.bigLb("\(self.names[0])"))
        }
        DispatchQueue.main.async {
           // self.content.addChild(SKSpriteNode(texture: self.pilot.texture))
        }
    }
    public func addError(step: Int, coder: Speaker){
print("errororoororor")
        DispatchQueue.main.async{
            self.buttonNode.run(self.fadeIn(self.buttonNode))
            //self.button.addTarget(self, action: #selector(self.next), for: UIControlEvents.touchUpInside)
           // self.view.addSubview(self.button)
            
        }
        DispatchQueue.main.async{
            self.text.text = "Uh oh! \(coder.rawValue), take another look at step \(step)."
        }
        self.scene = 0
       
    }
    func fadeIn(_ node: SKNode) -> SKAction{
        node.alpha = 0.0
        let sequence = SKAction.sequence([SKAction.fadeIn(withDuration: 1.0)])
        return sequence
    }
    func fadeOut(_ node: SKNode) -> SKAction{
        let remove = SKAction.run {
           node.removeFromParent()
        }
        let sequence = SKAction.sequence([SKAction.fadeOut(withDuration: 1.0), remove])
        return sequence
    }
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
            
            self.addSmNav(0.25)
            self.addSmPilot(1.0)
        }
        
//        DispatchQueue.main.async{
//            self.pilot.run(self.fadeOut(self.pilot))
//        }
    }
    func addSmNav(_ alpha: CGFloat){
        DispatchQueue.main.async {
            let add = SKAction.run{
            self.navigator.removeAllChildren()
            let pic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/astronautsm"))
            pic.alpha = alpha
            self.navigator.setScale(1/2)
            self.navigator.position = CGPoint(x: 75, y: 310)
            let face = SKSpriteNode(texture: SKTexture(image:  self.images[1]))
            face.setScale(((pic.texture?.size().width)! * 0.3)/(face.texture?.size().width)!)
            face.position = CGPoint(x: face.position.x, y:      ((pic.texture?.size().height)! * 0.2))
            face.alpha = alpha
            self.navigator.addChild(face)
            self.navigator.addChild(pic)
            self.content.addChild(self.navigator)
            }
             self.navigator.run(SKAction.sequence( [self.fadeOut(self.navigator), add, SKAction.fadeIn(withDuration: 1.0)]))
        }
            
        
            //self.navigator.run(SKAction.sequence( [self.fadeOut(self.navigator), wait]))
        }
    func addSmPilot(_ alpha: CGFloat){
    DispatchQueue.main.async {
        let add = SKAction.run{
             self.pilot.removeAllChildren()
           let pic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/astronautsm"))
           pic.alpha = alpha
            self.pilot.setScale(1/2)
            
           
           
          self.pilot.position = CGPoint(x: 50, y: 310)//, pos2: CGPoint(x: 75, y: 310))
            let face = SKSpriteNode(texture: SKTexture(image:  self.images[0]))
            face.setScale(((pic.texture?.size().width)! * 0.3)/(face.texture?.size().width)!)
            face.position = CGPoint(x: face.position.x, y:      ((pic.texture?.size().height)! * 0.2))
            face.alpha = alpha
            self.pilot.addChild(face)
            self.pilot.addChild(pic)
             self.content.addChild(self.pilot)
          
            print("dhow")
        }
     //   self.pilot.run(add)
     
        self.pilot.run(SKAction.sequence( [self.fadeOut(self.pilot), add, SKAction.fadeIn(withDuration: 1.0)]))
          //self.navigator.run(SKAction.sequence( [self.fadeOut(self.navigator), wait]))
    }
        
        DispatchQueue.main.async {
           self.createSpeach()
           self.removeButton(0.0)
        }
    }
    func scene2(){
        //self.basic()
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
    //MARK: User Utils
    func createSpeach(){
        DispatchQueue.main.async{
            print(self.names)
            self.createBubble("\(self.names[1]) (Pilot)", CGPoint(x: 300, y: 310))
            self.text.text = self.narrative[0].1
        }
    }
    func createError(){
        DispatchQueue.main.async{
            let pos = CGPoint(x: 256, y: 185)
            self.createBubble("Mission Control", pos)
        }
    }
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
//        func addAvatarsSmall(pos1: CGPoint, pos2: CGPoint){
//            let path = "Images/astronaut" + ex
//            DispatchQueue.main.async {
//
//                DispatchQueue.main.async {
//                    let pic = SKSpriteNode(texture: SKTexture(imageNamed: path))
//                    pic.setScale(1/2)
//                    let face = SKSpriteNode(texture: SKTexture(image: self.images[1]))
//                    face.setScale(((pic.texture?.size().width)! * 0.15)/(face.texture?.size().width)!)
//                    face.position = CGPoint(x: face.position.x, y:      ((pic.texture?.size().height)! * 0.1))
//
//                    self.navigator.addChild(face)
//                    self.navigator.addChild(pic)
//                    self.navigator.position = pos1
//                    self.content.addChild(self.navigator)
//                    self.navigator.run(self.fadeIn(self.navigator))
//                }
//                DispatchQueue.main.async {
//                    let pic = SKSpriteNode(texture: SKTexture(imageNamed: path))
//                    pic.setScale(1/2)
//                    let face = SKSpriteNode(texture: SKTexture(image:  self.images[0]))
//                    face.setScale(((pic.texture?.size().width)! * 0.15)/(face.texture?.size().width)!)
//                    face.position = CGPoint(x: face.position.x, y:      ((pic.texture?.size().height)! * 0.1))
//                    self.pilot.addChild(face)
//                    self.pilot.addChild(pic)
//                    self.pilot.position = pos2
//                    self.content.addChild(self.pilot)
//                    self.pilot.run(self.fadeIn(self.pilot))
//                }
//            }
    }
    func bigLb(_ text: String) -> SKLabelNode{
        let label = SKLabelNode(text: text)
        label.fontName = UIFont.systemFont(ofSize: 1.0, weight: .heavy).fontName
        label.fontColor = .white
        label.fontSize = 25.0
        label.position = CGPoint(x: label.position.x, y: -130)
        return label
    }
}



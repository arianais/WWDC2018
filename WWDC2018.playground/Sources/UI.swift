////Welcome to the brains of the UI. You do not want to edit this file. Back away slowly and no harm will come :P.

import SpriteKit
import PlaygroundSupport

public class UI {
    let background = UIColor(red: (34.0/255.0), green: (33.0/255.0), blue: (58.0/255.0), alpha: 1.0)
    
    //MARK: Nodes
    let content = SKNode()
    let rocket = SKSpriteNode(texture: SKTexture(imageNamed: "Images/rocket"))
    let stars = SKSpriteNode()
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
    var button = UIButton.init(frame: CGRect(x: 455, y: 10, width: 50, height: 50))
    let view = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 369))
    var scene = 0
    
    //    //MARK: Narrative
    //    var names = []
    enum Speaker {
        case pilot
        case navigator
    }
    var narrative: [(Speaker, String)] = [(.pilot, "Starting up the rocket's engine...."), (.pilot, "Getting the rocket's current position..."), (.navigator, "Connecting to the rocket's navigation system..."), (.navigator, "Setting the route's starting and ending points..."), (.navigator, "Setting the route's first stop..."),  (.navigator, "Setting the route's second stop..."),  (.navigator, "Downloading directions from the navigation system..."), (.pilot, "Starting directions from the navigation system..."),  (.pilot, "Blasting off!")]
    
    public init(){
       PlaygroundPage.current.liveView = view
        
    }
    func startAnimation(){
        let scene = SKScene(size: CGSize(width: 512, height: 369))
        scene.scaleMode = .aspectFit
        scene.backgroundColor = background
        view.presentScene(scene)
        content.position = CGPoint(x: 0, y: 0)
        scene.addChild(content)
        //self.scene = 2
        scene1()
        // createHalfCricle()
    }
    func test(){
        let blueBox = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 150, height: 150))
        blueBox.position = CGPoint(x: 30, y: 0)
        content.addChild(blueBox)
        let redBox = SKSpriteNode(color: SKColor.red, size: CGSize(width: 150, height: 150))
        content.position = CGPoint(x: 150, y: 0)
        content.addChild(redBox)
        
    }
    @objc func next(_ selector: UIButton){
        switch scene {
        case 0:
            if(narrative.count > 0){
                switch narrative[0].0 {
                case .navigator:
                    self.name.text = "Name" + " (Navigator)"//add name
                default:
                    self.name.text = "Name" + " (Pilot)"//add name
                }
                self.text.text = narrative[0].1
                self.narrative.remove(at: 0)
            }
            else{
                self.scene = 1
                next(selector)
            }
        case 1:
            self.speach.isHidden = true
            self.navigator.isHidden = true
            self.pilot.isHidden = true
            scene2()
            moveStars(count: 1)
            
            moveOutPlanet(oldPlanet: earth, newPlanet: self.purpleplanet)
            animateAliens()
            self.scene = 2
        case 2:
            scene3()
            moveStars(count: 1)
            moveOutPlanet(oldPlanet: self.purpleplanet, newPlanet: self.grayplanet)
            animateCommet()
            self.scene = 3
        default:
            return
        }
    }
    //MARK: Animation
    func animateCommet(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x:550, y:275))
        path.addCurve(to: CGPoint(x:-25, y:200), controlPoint1: CGPoint(x:300, y:325), controlPoint2: CGPoint(x:200, y:325))
        
        
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
        //commet.run(SKAction.group([movementSequence, fadeSequence]))
    }
    func createHalfCricle(){
        
        //        let longLine = UIBezierPath()
        //        longLine.move(to: CGPoint(x:0, y:25))
        //        longLine.addLine(to: CGPoint(x:375, y:25))
        //        content.addChild(SKShapeNode(path: longLine.cgPath))
        
        // add the first straight line
        //        let line1 = UIBezierPath()
        //        line1.move(to: CGPoint(x:0, y:25))
        //        line1.addLine(to: CGPoint(x: 0, y:25))
        
        // make the curved line
        
        
        // line2.addCurve(to: CGPoint(x:300, y:300), controlPoint1: CGPoint(x:270, y:300), controlPoint2: CGPoint(x:300, y:300))
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
    //    func fadeCommet(_ number: Int) -> SKAction{
    //        let run = SKAction.run {
    //            let fadeOut = SKAction.fadeOut(withDuration: 1.0)
    //            let remove = SKAction.run {
    //                self.commet.children[0].removeFromParent()
    //            }
    //            self.commet.children[0].run(SKAction.sequence([fadeOut, remove]))
    //            let fadeIn = SKAction.fadeIn(withDuration: 1.0)
    //            let newNode = SKSpriteNode(texture: SKTexture(imageNamed: "commets/commet\(number)") )
    //            newNode.alpha = 0.0
    //            self.commet.addChild(newNode)
    //            newNode.run(fadeIn)
    //
    //
    //
    //        }
    //        return run
    //    }
    func animateAliens(){
        let order = [0,1,2,2,2,3,3,3,3,3,4,5,6,6,6,7,8,8,8,8,8,8,8,8,8,9,10,11,12,13,14,15,16,17,18,19,19,19,19,19,19,20,21,22,22,22,23,24,25,25,25,26,26,26,26,26,27,27,27,27,27,28,27,29,28,27,29,28,27,29,27]
        var textures: [SKTexture] = []
        
        for e in order {
            textures.append(SKTexture(imageNamed: "Images/aliens/alien\(e)"))
        }
        let animate = SKAction.animate(with: textures, timePerFrame: (0.2))
        let wait = SKAction.wait(forDuration: 10.0)
        alien1.run(SKAction.sequence([wait, animate]))
        alien2.run(SKAction.sequence([wait, animate]))
        alien3.run(SKAction.sequence([wait, animate]))
        
    }
    func moveStars(count: Int){
        let sprite = self.stars
        
        let fadeIn = SKAction.moveBy(x: -300, y: 0, duration: 10.0)
        let fadeOut = SKAction.moveTo(x: 0, duration: 0.0)
        let seq01 = SKAction.sequence([ fadeIn, fadeOut])
        let repeater = SKAction.repeat(seq01, count: count)
        
        sprite.run(repeater)
        
        
        
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
            let star = SKSpriteNode(texture: SKTexture(imageNamed: "Images/stars"))
            star.setScale(1/6)
            star.position = CGPoint(x: 250, y:175)
            self.stars.addChild(star)
            self.content.addChild(self.stars)
        }
        DispatchQueue.main.async {
            let star = SKSpriteNode(texture: SKTexture(imageNamed: "Images/stars"))
            star.setScale(1/6)
            star.position = CGPoint(x: 750, y:175)
            self.stars.addChild(star)
        }
        DispatchQueue.main.async {
            self.rocket.setScale(1/6)
            self.rocket.position = CGPoint(x: 150, y: 165)
            self.content.addChild(self.rocket)
        }
        DispatchQueue.main.async {
            self.button.setImage(UIImage(named: "button"), for: .normal)
            self.button.addTarget(self, action: #selector(self.next), for: UIControlEvents.touchUpInside)
            self.view.addSubview(self.button)
            
        }
    }
    func scene1(){
        DispatchQueue.main.async {
            self.basic()
        }
        DispatchQueue.main.async {
            self.earth.setScale(1/2)
            self.earth.position = CGPoint(x: 400, y: 20)
            self.content.addChild(self.earth)
        }
        DispatchQueue.main.async {
            self.addAvatars()
        }
        DispatchQueue.main.async {
            self.createSpeach()
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
        DispatchQueue.main.async {
            let bubble = SKSpriteNode(texture: SKTexture(imageNamed: "Images/bubble"))
            bubble.setScale(1/6)
            self.speach.addChild(bubble)
        }
        DispatchQueue.main.async {
            self.text = SKLabelNode(text: self.narrative[0].1)
            self.text.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            self.text.position = CGPoint(x: -175, y: -15)
            self.text.fontSize = 14.0
            self.text.fontName = UIFont.systemFont(ofSize: 14.0, weight: .regular).fontName
            self.text.fontColor = .black
            self.speach.addChild(self.text)
            self.narrative.remove(at: 0)
        }
        DispatchQueue.main.async {
            self.name = SKLabelNode(text: "Name" + " (Pilot)")
            self.name.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            self.name.position = CGPoint(x: -175, y: 5)
            self.name.fontSize = 14.0
            self.name.fontName = UIFont.systemFont(ofSize: 14.0, weight: .bold).fontName
            self.name.fontColor = .black
            self.speach.addChild(self.name)
        }
        DispatchQueue.main.async {
            self.speach.position = CGPoint(x: 300, y: 310)
            self.content.addChild(self.speach)
        }
    }
    func addAvatars(){
        DispatchQueue.main.async {
            let pic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/photoshadow"))
            pic.setScale(1/6)
            self.navigator.addChild(pic)
            self.navigator.position = CGPoint(x: 60, y: 310)
            
            self.content.addChild(self.navigator)
        }
        DispatchQueue.main.async {
            let pic = SKSpriteNode(texture: SKTexture(imageNamed: "Images/photoshadow"))
            pic.setScale(1/6)
            self.pilot.addChild(pic)
            self.pilot.position = CGPoint(x: 85, y: 310)
            self.content.addChild(self.pilot)
        }
        
    }
}




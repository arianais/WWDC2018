////Welcome to the brains of the UI. You do not want to edit this file. Back away slowly and no harm will come :P.

import SpriteKit
import XCPlayground

public class UI {
    let background = UIColor(red: (34.0/255.0), green: (33.0/255.0), blue: (58.0/255.0), alpha: 1.0)
    
    //MARK: Nodes
    let content = SKNode()
    let rocket = SKSpriteNode(texture: SKTexture(imageNamed: "rocket"))
    let stars = SKSpriteNode(texture: SKTexture(imageNamed: "stars"))
    //MARK: Planet Nodes
    let earth = SKSpriteNode(texture: SKTexture(imageNamed: "earth"))
    let purpleplanet = SKSpriteNode(texture: SKTexture(imageNamed: "purpleplanet"))
    let grayplanet = SKSpriteNode(texture: SKTexture(imageNamed: "grayplanet"))
    
    //MARK: Extra Nodes
    let alien1 = SKSpriteNode(texture: SKTexture(imageNamed: "alien"))
    let alien2 = SKSpriteNode(texture: SKTexture(imageNamed: "alien"))
    let alien3 = SKSpriteNode(texture: SKTexture(imageNamed: "alien"))
    let commet = SKSpriteNode(texture: SKTexture(imageNamed: "commet"))
    
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
        XCPlaygroundPage.currentPage.liveView = view
        let scene = SKScene(size: CGSize(width: 512, height: 369))
        scene.scaleMode = .aspectFit
        scene.backgroundColor = background
        view.presentScene(scene)
        content.position = CGPoint(x: 0, y: 0)
        scene.addChild(content)
        scene2()
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
                self.scene = 2
                next(selector)
            }
        case 2:
            return
        default:
            return
        }
    }
    //MARK: Scene Setup Functions
    func basic(){
        DispatchQueue.main.async {
            self.stars.setScale(1/6)
            self.stars.position = CGPoint(x: 250, y:175)
            self.content.addChild(self.stars)
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
            self.earth.setScale(1/6)
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
        self.basic()
        DispatchQueue.main.async {
            self.purpleplanet.setScale(1/6)
            self.purpleplanet.position = CGPoint(x: self.purpleplanet.frame.width * 0.5, y: 20)
            self.content.addChild(self.purpleplanet)
        }
        DispatchQueue.main.async {
            self.alien1.setScale(1/6)
            self.alien1.position = CGPoint(x: 200, y: 75)
            self.content.addChild(self.alien1)
        }
        DispatchQueue.main.async {
            self.alien2.setScale(1/6)
            self.alien2.position = CGPoint(x: 300, y: 75)
            self.content.addChild(self.alien2)
        }
        DispatchQueue.main.async {
            self.alien3.setScale(1/6)
            self.alien3.position = CGPoint(x: 400, y: 75)
            self.content.addChild(self.alien3)
        }
        
    }
    func scene3(){
        DispatchQueue.main.async {
            self.basic()
        }
        DispatchQueue.main.async {
            self.grayplanet.setScale(1/6)
            self.grayplanet.position = CGPoint(x: self.grayplanet.frame.width * 0.5, y: 20)
            self.content.addChild(self.grayplanet)
        }
        DispatchQueue.main.async {
            self.commet.setScale(1/6)
            self.commet.position = CGPoint(x: 300, y: 150)
            self.content.addChild(self.commet)
        }
        DispatchQueue.main.async {
            self.createSpeach()
            self.addAvatars()
        }
    }
    //MARK: User Utils
    func createSpeach(){
        DispatchQueue.main.async {
            let bubble = SKSpriteNode(texture: SKTexture(imageNamed: "bubble"))
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
            let pic = SKSpriteNode(texture: SKTexture(imageNamed: "photoshadow"))
            pic.setScale(1/6)
            self.navigator.addChild(pic)
            self.navigator.position = CGPoint(x: 60, y: 310)
           
            self.content.addChild(self.navigator)
        }
        DispatchQueue.main.async {
            let pic = SKSpriteNode(texture: SKTexture(imageNamed: "photoshadow"))
            pic.setScale(1/6)
            self.pilot.addChild(pic)
            self.pilot.position = CGPoint(x: 85, y: 310)
            self.content.addChild(self.pilot)
        }
        
    }
}

let ui = UI()


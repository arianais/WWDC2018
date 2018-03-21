//Welcome to the brains of the UI. You do not want to edit this file. Back away slowly and no harm will come :P.

import UIKit
import SpriteKit
import SceneKit
import XCPlayground
import PlaygroundSupport

public class UI{
    let background = UIColor(red: (34.0/255.0), green: (33.0/255.0), blue: (58.0/255.0), alpha: 1.0)
    let scene: SKScene
    //let stars = SKNode
    
    public init(){
     
            //let cfURL = Bundle.main.url(forResource: "SFMono-Regular", withExtension: "otf") as! CFURL
           // CTFontManagerRegisterFontsForURL(cfURL , CTFontManagerScope.process, nil)
            let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: (1024/2), height: (738/2)))
            scene = SKScene()
            scene.scaleMode = .aspectFill
            scene.backgroundColor = background
            sceneView.presentScene(scene)
            PlaygroundPage.current.liveView = sceneView
       
      
    }
}

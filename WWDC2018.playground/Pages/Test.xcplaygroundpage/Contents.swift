import Foundation
import UIKit
import SpriteKit


let rocket = Rocket()
rocket.startEngine()
rocket.pilot = "Tim"
rocket.navigator = "Ari"
let stop1 = "Tearth"
let position = rocket.position
let system = rocket
//let navigation = system.navigation
rocket.start = position
rocket.end = position
rocket.stop1 = stop1
let stop2 = "Arianatopia"
rocket.stop2 = stop2
let directions = rocket.loadDirections()
rocket.startNavigation()

rocket.directions = directions
rocket.blastOff()




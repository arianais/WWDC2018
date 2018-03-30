import Foundation
import UIKit
import SpriteKit
//public struct Stack<Element> {
//    fileprivate var array: [Element] = []
//
//    public mutating func push(_ element: Element) {
//        array.append(element)
//    }
//
//    public mutating func pop() -> Element? {
//        return array.popLast()
//    }
//
//    public func peek() -> Element? {
//        return array.last
//    }
//}
//public class Rocket{
//    public var navigator: String? {
//        didSet{
//            DispatchQueue.global(qos: .default).async {
//                self.stack.push(2)
//                self.update()
//            }
//        }
//    }
//    public var pilot: String? {
//        didSet{
//            DispatchQueue.global(qos: .default).async {
//                self.stack.push(1)
//                self.update()
//            }
//        }
//    }
//    public var navigation: Navigation{
//        set(value){
//            self.navigation = value
//        }
//        get{
//            group.enter()
//            DispatchQueue.global(qos: .default).async{
//                self.update()
//                self.group.leave()
//            }
//            group.notify(queue:   DispatchQueue.global(qos: .default)) {
//                print("hiii4")
//
//            }
//            return Navigation()
//        }
//    }
//    public var position: Position? {
//        get{
//            DispatchQueue.global(qos: .default).async {
//                self.stack.push(3)
//                self.update()
//            }
//            return Position("Earth")
//        }
//    }
//    public var directions: Directions? {
//        didSet{
//            update()
//            group.enter()
//            group.leave()
//        }
//    }
//
//    private var status: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
//
//    let group = DispatchGroup()
//    var stack = Stack<Int>()
//
//
//    var cookies = [-1]
//    var ui = UI()
//    var count = 0
//    public init() {
//        group.enter()
//
//
//    }
//    func update()  {
//        print(self.stack.peek())
//        if(self.stack.peek() != nil){
//            self.status[self.stack.pop()!] = true
//        }
//
//
//
//        //        DispatchQueue.global(attributes: .qosDefault).async {
////        print("i: \(stack.peek()) )")
////        while( stack.peek() != -1){
////            status[stack.pop()!] = true
////        }
////        else{
////            print("aHiiiii")
////        }
//
//        //group.leave()
//        //        }
//        //         group.wait()
//        //        print("a")
//    }
//    public func startEngine() {
//        DispatchQueue.global(qos: .default).async {
//            self.stack.push(0)
//            self.update()
//        }
//    }
//    public func blastOff() {
//        DispatchQueue.global(qos: .default).async {
//            self.group.leave()
//        }
//        group.wait()
//        var error = 0
//        while(self.status.count > error && self.status[error] != false) {
//            error += 1
//        }
//        if (error == 0) {
//            print("hia")
//        }
//        ui.addError(i: 0, coder: UI.Speaker.pilot)
//        print(error)
//
//        print("hia")
//    }
//    public class Navigation: Rocket{
//        //public var rocket: Rocket?
//        public var start: Position? {
//            didSet{
//                super.update()
//                super.group.enter()
//                super.group.leave()
//            }
//        }
//        public var end: Position? {
//            didSet{
//                super.update()
//                super.group.enter()
//                super.group.leave()
//            }
//        }
//        public var stop1: String?{
//            didSet{
//                super.update()
//                super.group.enter()
//                super.group.leave()
//            }
//        }
//        public var stop2: String?{
//            didSet{
//                super.update()
//                super.group.enter()
//                super.group.leave()
//            }
//        }
//        override public var directions: Directions?{
//            set(value){
//                self.directions = value
//            }
//            get{
//                super.update()
//                super.group.enter()
//                super.group.leave()
//                return Directions()
//            }
//        }
//
//    }
//    public class Position{
//        var value: String?
//        public init(_ value: String?){
//            self.value = value
//        }
//    }
//    public class Directions{
//        public init(){
//
//        }
//    }
//}
//let button = SKButtonNode(text: "continue", rectOf: CGSize(width: 280, height: 40), cornerRadius: 10.0)
//button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)

let rocket = Rocket()
rocket.startEngine()
rocket.pilot = "Tim"
rocket.navigator = "Ari"
let stop1 = "Tearth"
let position = rocket.position
let system = rocket
let navigation = system.navigation
navigation.start = position
navigation.end = position
navigation.stop1 = stop1
let stop2 = "Arianatopia"
navigation.stop2 = stop2
//let directions = navigation.directions
//rocket.directions = directions
rocket.blastOff()




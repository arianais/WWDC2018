import Foundation
public struct Stack<Element> {
    fileprivate var array: [Element] = []
    
    public mutating func push(_ element: Element) {
        array.append(element)
    }
    
    public mutating func pop() -> Element? {
        return array.popLast()
    }
    
    public func peek() -> Element? {
        return array.last
    }
}
public class Rocket{
    public var navigator: String? {
        didSet{
            DispatchQueue.global(qos: .default).sync{
                stack.push(2)
            }
        }
    }
    public var pilot: String? {
        didSet{
            DispatchQueue.global(qos: .default).sync{
                self.update()
                stack.push(1)
            }
        }
    }
    public var navigation: Navigation{
        set(value){
            self.navigation = value
        }
        get{
            group.enter()
            DispatchQueue.global(qos: .default).async{
                self.update()
                self.group.leave()
            }
            group.notify(queue:   DispatchQueue.global(qos: .default)) {
                print("hiii4")
                
            }
            return Navigation()
        }
    }
    public var position: Position? {
        get{
            DispatchQueue.global(qos: .default).async{
                self.update()
                self.group.leave()
            }
            return Position("Earth")
        }
    }
    public var directions: Directions? {
        didSet{
            update()
            group.enter()
            group.leave()
        }
    }
    
    private var status: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    let group = DispatchGroup()
    var stack = Stack<Int>()
   

    var cookies = [-1]
  
    var count = 0
    public init() {
        print("hello")
        DispatchQueue.global(qos: .default).sync{
            stack.push(-1)
            stack.push(0)
        }
        //let ui = UI()

    }
    func update()  {
        
        //        DispatchQueue.global(attributes: .qosDefault).async {
        print("i: \(stack.peek()) )")
        if( stack.peek() != -1){
            status[stack.pop()!] = true
        }
        else{
            print("aHiiiii")
        }
      
        //group.leave()
        //        }
        //         group.wait()
        //        print("a")
    }
    public func startEngine() {
        update()
        group.enter()
        group.leave()
    }
    public class Navigation: Rocket{
        //public var rocket: Rocket?
        public var start: Position? {
            didSet{
                super.update()
                super.group.enter()
                super.group.leave()
            }
        }
        public var end: Position? {
            didSet{
                super.update()
                super.group.enter()
                super.group.leave()
            }
        }
        public var stop1: String?{
            didSet{
                super.update()
                super.group.enter()
                super.group.leave()
            }
        }
        public var stop2: String?{
            didSet{
                super.update()
                super.group.enter()
                super.group.leave()
            }
        }
        override public var directions: Directions?{
            set(value){
                self.directions = value
            }
            get{
                super.update()
                super.group.enter()
                super.group.leave()
                return Directions()
            }
        }
        
    }
    public class Position{
        var value: String?
        public init(_ value: String?){
            self.value = value
        }
    }
    public class Directions{
        public init(){
            
        }
    }
}
let rocket = Rocket()
rocket.pilot = "Tim"
rocket.navigator = "Ari"
let stop1 = "Tearth"
let position = rocket.position
let system = rocket
//
//let navigation = system.navigation
//navigation.start = position
//navigation.end = position
//navigation.stop1 = stop1
//let stop2 = "Arianatopia"
//navigation.stop2 = stop2
//let directions = navigation.directions
//rocket.directions = directions
//rocket.startEngine()



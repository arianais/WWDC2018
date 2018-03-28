import Foundation

public class Rocket{
    public var navigator: String? {
        didSet{
            update(2)
            group.enter()
            group.leave()
        }
    }
    public var pilot: String? {
        didSet{
            update(1)
            group.enter()
            group.leave()
        }
    }
    public var navigation: Navigation{
        set(value){
            self.navigation = value
        }
        get{
            update(4)
            group.enter()
            group.leave()
            return Navigation()
        }
    }
    public var position: Position? {
        get{
            update(3)
            group.enter()
            group.leave()
            return Position("Earth")
        }
    }
    public var directions: Directions? {
        didSet{
            update(10)
            group.enter()
            group.leave()
        }
    }
    
    private var status: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    let group = DispatchGroup()
    public init() {
        print("hello")
        //self.navigation = Navigation()
        self.update(0)
        //let ui = UI()
        group.enter()
        group.leave()
    }
    func update(_ i: Int)  {
        
        //        DispatchQueue.global(attributes: .qosDefault).async {
        print("i: \(i)")
        status[i] = true
        //group.leave()
        //        }
        //         group.wait()
        //        print("a")
    }
    public func startEngine() {
        update(11)
        group.enter()
        group.leave()
    }
    public class Navigation: Rocket{
        //public var rocket: Rocket?
        public var start: Position? {
            didSet{
                super.update(5)
                super.group.enter()
                super.group.leave()
            }
        }
        public var end: Position? {
            didSet{
                super.update(6)
                super.group.enter()
                super.group.leave()
            }
        }
        public var stop1: String?{
            didSet{
                super.update(7)
                super.group.enter()
                super.group.leave()
            }
        }
        public var stop2: String?{
            didSet{
                super.update(8)
                super.group.enter()
                super.group.leave()
            }
        }
        override public var directions: Directions?{
            set(value){
                self.directions = value
            }
            get{
                super.update(9)
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

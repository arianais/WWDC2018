import Foundation

public class Rocket{
    public var navigator: String? {
        didSet{
            update(2)
        }
    }
    public var pilot: String? {
        didSet{
            update(1)
        }
    }
    public var navigation: Navigation{
        set(value){
            self.navigation = value
        }
        get{
            update(4)
            return Navigation()
        }
    }
    public var position: Position? {
        get{
            update(3)
            return Position("Earth")
        }
    }
    public var directions: Directions? {
        didSet{
            update(10)
        }
    }
    
    private var status: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    public init() {
        print("hello")
        //self.navigation = Navigation()
        self.update(0)
        //let ui = UI()
    }
    func update(_ i: Int)  {
        print("i: \(i)")
        status[i] = true
    }
    public func startEngine() {
        update(11)
    }
    public class Navigation: Rocket{
        //public var rocket: Rocket?
        public var start: Position? {
            didSet{
                super.update(5)
            }
        }
        public var end: Position? {
            didSet{
                super.update(6)
            }
        }
        public var stop1: String?{
            didSet{
                super.update(7)
            }
        }
        public var stop2: String?{
            didSet{
                super.update(8)
            }
        }
        override public var directions: Directions?{
            set(value){
                self.directions = value
            }
            get{
                super.update(9)
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

import Foundation
public class Rocket{
    public var navigator: String? {
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(2)
            }
        }
    }
    public var pilot: String? {
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(1)
            }
        }
    }
    public func startNavigation() {
        DispatchQueue.global(qos: .default).async {
            self.update(9)
        }
    }
    public var position: Position? {
        get{
            DispatchQueue.global(qos: .default).async {
                self.update(3)
            }
            return Position("Earth")
        }
    }
    public var start: Position? {
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(4)
            }
        }
    }
    public var end: Position? {
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(5)
            }
        }
    }
    public var stop1: String?{
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(6)
            }
        }
    }
    public var stop2: String?{
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(7)
            }
        }
    }

    
    public var directions: Directions? {
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(10)
            }
        }
    }
    public func loadDirections() -> Directions{
        DispatchQueue.global(qos: .default).async {
            self.update(8)
        }
        return Directions()
    }
    
    private var status: [Bool] = [false, false, false, false, false, false, false, false, false, false, false]
    let group = DispatchGroup()
    var cookies = [-1]
    var count = 0
    public init() {
        group.enter()
        
        
    }
    func update(_ i: Int)  {
       
            self.status[i] = true
    
        
        
        
        //        DispatchQueue.global(attributes: .qosDefault).async {
        //        print("i: \(stack.peek()) )")
        //        while( stack.peek() != -1){
        //            status[stack.pop()!] = true
        //        }
        //        else{
        //            print("aHiiiii")
        //        }
        
        //group.leave()
        //        }
        //         group.wait()
        //        print("a")
    }
    public func startEngine() {
        DispatchQueue.global(qos: .default).async {
            self.update(0)
        }
    }
    public func blastOff() {
        
        DispatchQueue.global(qos: .default).async {
            self.group.leave()
        }
        group.wait()
      
        if (!self.status.contains(false)) {
            //no errors
           let ui = UI([self.navigator!, self.pilot!])
       
        }
        else{
            let ui = UI([])
            print("error")
            var error = 0
            while(self.status.count > error && self.status[error] != false) {
                error += 1
            }
            if(error > 4 && error < 8){
                print(error)
                ui.addError(step: error + 1, coder: UI.Speaker.navigator)
            }
            else{
                print(error)
                ui.addError(step: error + 1, coder: UI.Speaker.pilot)
            }
            
        }
        

    }
    public class Navigation: Rocket{
        //public var rocket: Rocket?
//        public var start: Position? {
//            didSet{
//                print("hey")
//                super.update(5)
//            }
//        }
//        public var end: Position? {
//            didSet{
//                super.update(6)
//            }
//        }
//        public var stop1: String?{
//            didSet{
//                super.update(7)
//            }
//        }
//        public var stop2: String?{
//            didSet{
//                super.update(8)
//            }
//        }
       
        
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






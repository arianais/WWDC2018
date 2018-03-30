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
    public var navigation: Navigation{
        set(value){
            self.navigation = value
        }
        get{
            DispatchQueue.global(qos: .default).async{
                self.update(4)
            }
            group.notify(queue:   DispatchQueue.global(qos: .default)) {
                print("hiii4")
            }
            return Navigation()
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
    public var directions: Directions? {
        didSet{
            update(10)
        }
    }
    
    private var status: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    let group = DispatchGroup()
    var stack = Stack<Int>()
    
    
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
            var error = 0
            while(self.status.count > error && self.status[error] != false) {
                error += 1
            }
            if(error > 4 && error < 8){
                ui.addError(step: error + 1, coder: UI.Speaker.navigator)
            }
            else{
                ui.addError(step: error + 1, coder: UI.Speaker.pilot)
            }
            
        }

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
                print("step 9")
                super.update(9)
                return self.directions
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






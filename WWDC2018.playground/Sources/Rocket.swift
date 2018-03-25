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
    private var status: [Bool] = [false, false]
    public init() {
        print("hello")
        update(0)
        //let ui = UI()
    }
    func update(_ i: Int)  {
        print("i: \(i)")
        status[i] = true
    }
}

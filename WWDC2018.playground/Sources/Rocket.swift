//  Welcome to the brains of the rocket. You do not want to edit this file. Back away slowly and no harm will come to your playground :).
//
//
//  Created by Ariana Isabel Sokolov on 3/20/18.
//  Copyright © 2017 Logical Nonsense, LLC. All rights reserved.

import Foundation
public class Rocket{
    //MARK: Private Variables
    private var status: [Bool] = [false, false, false, false, false, false, false, false, false, false, false]
    private let group = DispatchGroup()
    //MARK: Public Variables
    //navigator: variable that refers to the navigator's name
    public var navigator: String? {
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(2)
            }
        }
    }
    //pilot: variable that refers to the pilot's name
    public var pilot: String? {
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(1)
            }
        }
    }
    //position: position of the rocket ship
    public var position: Position? {
        get{
            DispatchQueue.global(qos: .default).async {
                self.update(3)
            }
            return Position("Earth")
        }
    }
    //start: starting position of the rocket
    public var start: Position? {
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(4)
            }
        }
    }
    //end: ending position of the rocket
    public var end: Position? {
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(5)
            }
        }
    }
    //stop1: name of the rocket's first stop
    public var stop1: String?{
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(6)
            }
        }
    }
    //stop2: name of the rocket's second stop
    public var stop2: String?{
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(7)
            }
        }
    }
    //directions: varaible that refers to the directions for the route that the rocket will be taking on its journey
    public var directions: Directions? {
        didSet{
            DispatchQueue.global(qos: .default).async {
                self.update(10)
            }
        }
    }
    //MARK: Init
    public init() {
        group.enter()
    }
    //MARK: Public Functions
    //start engine: stars the rocket's engine
    public func startEngine() {
        DispatchQueue.global(qos: .default).async {
            self.update(0)
        }
    }
    //load directions: loads directions for the rocket's journey
    public func loadDirections() -> Directions{
        DispatchQueue.global(qos: .default).async {
            self.update(8)
        }
        return Directions()
    }
    //start navigation: starts the ship's navigation system
    public func startNavigation() {
        DispatchQueue.global(qos: .default).async {
            self.update(9)
        }
    }
    //blastoff: allows the rocket to take off, checks for errors in the students' code, and dictates the playground's animations
    public func blastOff() {
        DispatchQueue.global(qos: .default).async {
            self.group.leave()
        }
        group.wait()
        if (!self.status.contains(false)) {
            let _ = UI([self.navigator!, self.pilot!, self.stop1!, self.stop2!])
        }
        else{
            let ui = UI([])
            var error = 0
            while(self.status.count > error && self.status[error] != false) {
                error += 1
            }
            if(error > 4 && error < 8){
                ui.addError(step: error + 1, coder: .navigator)
            }
            else{
                ui.addError(step: error + 1, coder: .pilot)
            }
            
        }
    }
    //MARK: Private Functions
    //update: updates the status array when a coder has filled in or called a function correctly
    func update(_ i: Int)  {
            self.status[i] = true
    }
    //MARK: Public Classes
    //Position: class that takes in a value and returns a Position object
    public class Position{
        var value: String?
        public init(_ value: String?){
            self.value = value
        }
    }
    //Directions: class that returns a Directions object
    public class Directions{
        public init(){
        }
    }
}






//let ui = UI()
/*:
 # To Infinity and Beyond!
 - Note:
 **This playground was made to help children with mild autism and ADHD with collaboration and organizational skills.** As many of these children have innate characteristics that make them natural-born coders, such as their ability to hyperfocus and see problems differently, coding is a natural medium to help these children with the difficulties they face.
 
 ## Some Notes from Mission Control
 Hi there, coders! Recently, you both bought your very own planets. Together, you are going to go on a joyride through space to check out your new real estate.
 
 - Before you jouney through space, first **decide who is going to be the spaceship's pilot, and who is going to be the navigator.**
 
 - To ensure everyone's safety on the jouney, try to **make sure that only one person is looking at the screen at a time**, unless otherwise noted. That way, you'll be able to watch out for any unexpected astroids headed your way.
 
 - During the mission, both the navigator and the pilot will be writing code that the other will be using. After you finish writing your code you should **fill in the green `Comment Template` located under where you wrote your code.**
 
 - Then **scroll up the comment template so it borders the top of the page** before passing the keyboard to your partner. Since the rocket has a limited fuel supply, it's important to code as efficently as possible. Writing good  `Comment Template`s and putting them at the top of the screen before passing it to your partner will help accomplish this.
 
 If this seems confusing, don't worry. It will make a lot more sense after we blast off. :)
 :*/

/*:
## Preparing for Takeoff
### Pilot, take the keyboard!
1. First, make the rocket.
Create a  `rocket` variable, and set it equal to `Rocket()`.
Set `rocket.pilot` equal to a String of your first name, and set `rocket.navigator` equal to a String of your partner's first name.
- Example:
```
let rocket = Rocket()
rocket.pilot = "Tim"
rocket.navigator = "Ari"
```
:*/
let rocket = Rocket()
rocket.pilot = "Tim"
rocket.navigator = "Ari"
/*:
2. Next, let's swing by your new planet.
Create a `stop1` variable, and set it equal to a String of your planet's name.
- Example:
`let stop1 = "Tearth"`
 :*/
let stop1 = "Tearth"
/*:
3. Now, make sure the rocket has your location.
Create a `position` variable, and set it equal to the rocket's current position(`rocket.position`).
- Example:
`let position = rocket.positon`
:*/
let position = rocket.position
/*:
4. Fill in the `Comment Template` below, then **scroll up until you see this text at the top of your screen**(and your code is hidden!).
:*/
//****************
//Comment Template
//****************
//variable: (FILL IN NAME OF VARIABLE)
//type: String
//reference: The name of the pilot's planet.
//-----
//variable: (FILL IN NAME OF VARIABLE)
//type: Rocket
//reference: The rocket you will be taking on your journey
//-----
//variable: (FILL IN NAME OF VARIABLE)
//type: Position
//reference: Current position of the rocket.
/*:
 ### Navigator, take the keyboard!
 1. First, access the rocket.
 Create a `system` variable, and set it equal to the variable referring to the rocket.
 - Example:
 `let system = rocket`
 :*/
let system = rocket
/*:
 2. Now, get access to the rocketship's navigation.
 Create a `navigation` variable, and set it equal to the `system.navigation`.
 - Example:
 `let navigation = system.navigation`
 :*/
let navigation = system.navigation
/*:
 3. We have to be sure the journey starts and ends right here.
 Set `navigation.start` and `navigation.end` equal to the **position** variable that your pilot made above.
 - Example:
 ```
navigation.start = position
navigation.end = position
```
:*/
navigation.start = position
navigation.end = position
/*:
 4. Let's add the first stop on our intergalactic trip.
 Set `navigation.stop1` equal to the name of the pilot's planet defined above.
 - Example:
 `navigation.stop1 = stop1`
 :*/
navigation.stop1 = stop1
/*:
 5. Let's add the second stop on our trip.
 Create a `stop2` variable, and set it equal to a String of your planet's name. Then, set `navigation.stop2` equal to `stop2`.
 - Example:
 `let stop2 = "Arianatopia"`
 `navigation.stop2 = stop2`
:*/
let stop2 = "Arianatopia"
navigation.stop2 = stop2
/*:
 6. Let's send our navigation system the stops we just created for our trip.
 Create a `directions` variable, and set it equal to `navigation.directions`.
 - Example:
 `let directions = navigation.directions`
 :*/
let directions = navigation.directions
 /*:
 7. Fill in the `Comment Template` below, then **scroll up you see this sentance at the top of the screen**(and your code is hidden).
:*/

//****************
//Comment Template
//****************
//variable: (FILL IN NAME OF VARIABLE)
//type: Navigation
//reference: Refers to the rocket's navigation.
//-----
//variable: (FILL IN NAME OF VARIABLE)
//type: String
//reference: The name of the navigator's planet.
//-----
//variable: (FILL IN NAME OF VARIABLE)
//type: Directions
//reference: The route the rocket will be taking to get to each stop.
/*:
 ### Pilot, take the keyboard!
 1. Let's give our rocket those directions!
 Set `rocket.directions` equal to the variable referring to the rocket's route, made by your teammate!
 - Example:
 `rocket.directions = directions`
  :*/
rocket.directions = directions
 /*:
 2. Start up the rocket's engine and get ready for takeoff by calling `rocket.startEngine()`.
 - Example:
 `rocket.startEngine()`
  :*/
rocket.startEngine()
/*:
 Now call the navigator over and blast off by running the program!
 :*/



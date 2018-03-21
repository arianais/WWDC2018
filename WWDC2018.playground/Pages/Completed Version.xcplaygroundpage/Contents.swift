/*:
# To Infinity and Beyond!
 - Note:
**This playground was made to help children with mild autism and ADHD with collaboration and organizational skills.** As many of these children have innate characteristics that make them natural-born coders, such as their ability to hyperfocus and see problems differently, coding is a natural medium to help these children with the difficulties they face.

## Some Notes from Mission Control
Hi there coders! Recently, you both bought your very own planets. Together, you are going to go on a joyride through space to check your new realestate out.

- Before you jouney through space, first **decide which one of you is going to be the spaceship's pilot and who is going to be the navigator.**

- To make sure everyone stays safe on the jouney, try to **make sure that only one person is looking at the screen at a time**, unless otherwise noted. That way you'll be able to watch out for unexpected astroids coming your way.

- During the mission, both the navigator and the pilot will be writing code that each other will be using. So, after you finish writing your code you should **fill in the green `Comment Template` located under where you wrote your code.**

- Then **scroll up the comment template so it borders the top of the page** before passing the keyboard to your partner. As we only have a limited supply of fule for the rocket, its important you code as efficently as possible. Writing good  `Comment Template`s and putting them at the top of the screen before passing it to your partner will accomplish this.

If this seems confusing, don't worry. It will make a lot more sense after we blast off. :)
 :*/

/*:
## Preparing for Takeoff
### Pilot, take the keyboard!
 1. Create a  `rocket` variable and set its value to `Rocket()` and set `rocket.pilot` equal to a String of your first name. Then, set  `rocket.naviagor` equal to a String of your partner's first name.
 - Example:
 `let rocket = Rocket()`
 `rocket.pilot = "Tim"`
 `rocket.navigator = "Ari"`
 
 2. We are first going to stop by your new planet. Lets create a `stop1` variable that refers to the name of your planet as a String.
 - Example:
 `let stop1 = "Tearth"`
 
 3. Next, lets intalize a new `position` variable that store's the rocket's current position(`rocket.position`).
 - Example:
 `let position = rocket.positon`

  Fill in the `Comment Template` below, then **scroll up you see this sentance at the top of the screen**(and your code is hidden).
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
 1. Set  `system` equal to the variable that refers to rocket you will be taking on your journey defined above.
 - Example:
`let system = rocket`
  2. Create an access point to the rocket's navigation system by creating a `navigation` variable and setting its value to  `system.navigation`.
 - Example:
 `let navigation = system.navigation`
 3. To make sure our route starts from and brings us back to our current location, Set `navigation.start` and `navigation.end` equal to the current position's variable defined by the pilot above.
 - Example:
 `navigation.start = position`
 `navigation.end = position`
 4. Add the first stop to your navigation variable by setting `navigation.stop1` equal to the name of the pilot's planet defined above.
 - Example:
 `navigation.stop1 = stop1`
 5. Create a variable `stop2` and set it equal to your planet's name as a String. Then set`navigation.stop2` equal to `stop2`
 - Example:
 `let stop2 = "Arianatopia"`
 `navigation.stop2 = stop1`
6. Set a new `directions` variable equal to `rocket.getDirections()`.
 - Example:
 `let directions = rocket.getDirections()`
 
  Fill in the `Comment Template` below, then **scroll up you see this sentance at the top of the screen**(and your code is hidden).
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
 1. Set  `rocket.directions` equal to the variable that refers to the route the rocket will be taking to get to each stop defined above.
 - Example:
 `rocket.directions = directions`
 2. Start up the rocket's engine and get ready for takeoff by calling `rocket.startEngine()`.
 - Example:
 `rocket.startEngine()`
 Now call the navigator over and blast off by running the program!
:*/
 

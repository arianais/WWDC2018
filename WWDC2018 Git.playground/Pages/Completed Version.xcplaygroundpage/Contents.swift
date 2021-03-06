/*:
 # To Infinity and Beyond!
 - Note:
 **This collaborative playground was designed to help children with mild autism, ADHD, and dyslexia with reading comprehension and organizational skills.** As many of these children have innate characteristics that make them natural-born coders, such as their ability to hyperfocus and see problems differently, coding is a natural medium to help these children with the difficulties they face.
 
 ## Some Notes from Mission Control
 Hi there, coders! Recently, you both bought your very own planets. Together, you are going to go on a joyride through space to check out your new real estate. **Here are some tips to make sure your journey goes as smoothly as possible.**
 
 - **Ensure only one person is looking at the screen at any point of time**, unless otherwise noted. That way you'll be able to watch out for unexpected asteroids coming your way!
 
 - Before passing the keyboard back to your partner, **scroll up the playground page so the top of the `Comment Template` borders the top of the computer screen**. Because fuel is limited on this mission, it is important that you code efficiently. Writing good  `Comment Template`s and making them visible to your partner will accomplish this.
 * Callout(Placement):
 ![Photo of Comment Template Placement](Images/instructions.png)
 
 If this seems confusing, don't worry. It will make a lot more sense after we blast off. :)
 
 ## Before your journey begins...
 
 ![Directory Photo](Images/resources.png)
 1. **Make sure you've added pictures of both you and your partner to the "Resources" folder as two separate images.** Each picture should contain a clear picture of your face (and no other faces), such as a school yearbook photo.
 * Callout(Sample Photos):
 ![Photo of Sample Photos](Images/examples.png)
 
 2. Run the program to see which one of you is going to be your rocket's pilot and who is going to be the navigator.
 
 ## Preparing for Takeoff
 
 ### Pilot, take the keyboard!
 1. First, start up the rocket's engine by calling `rocket.startEngine()`.
 - Example:
 `rocket.startEngine()`
 */
let rocket = Rocket()
rocket.startEngine()
/*:
 2. Set `rocket.pilot` equal to a String of your first name.
 - Example:
 `rocket.pilot = "Tim"`
 */
rocket.pilot = "Tim"
/*:
 3. Set `rocket.navigator` equal to a String of your partner's first name.
 - Example:
 `rocket.navigator = "Ari"`
 */
rocket.navigator = "Ari"
/*:
 4. Next, let's swing by your new planet.
 Create a `planet` variable, and set it equal to a String of your planet's name.
 - Example:
 `let planet = "Tearth"`
 */
let planet = "Tearth"
/*:
 5. Now, make sure the rocket has your location.
 Create a `position` variable, and set it equal to the rocket's current position(`rocket.position`).
 - Example:
 `let position = rocket.positon`
 */
let position = rocket.position
/*:
 6. Fill in the `Comment Template` below, then **scroll up until you see `Comment Template` at the top of your screen**.(Make sure the code you just wrote is hidden!)
 */
//
//****************
//Comment Template
//****************
//variable: rocket
//type: Rocket
//reference: the rocket you will be taking on your journey
//-----
//variable: position
//type: Position
//reference: current position of the rocket
//-----
//variable: planet
//type: String
//reference: the name of the pilot's planet
/*:
 
 ### Navigator, take the keyboard!
 7. Let's access the rocket. Create a `system` variable, and set it equal to the variable referring to the rocket, defined to above.
 - Example:
 `let system = rocket`
 */
let system = rocket
/*:
 8. We have to be sure the journey starts and ends right here.
 Set `system.start` and `system.end` equal to the **position** variable that your pilot made above.
 - Example:
 ```
 system.start = position
 system.end = position
 ```
 */
system.start = position
system.end = position
/*:
 9. Let's add the first stop on our intergalactic trip. Create a `stop1` variable, and set it equal to a String of your planet's name. Then, set `system.stop1` equal to `stop1`.
 - Example:
 ` ` `
 let stop1 = "Arianatopia"
 system.stop1 = stop1
 ` ` `
 */
let stop1 = "Arianatopia"
system.stop1 = stop1
/*:
 10. Let's add the second stop on our trip.
 Set `system.stop2` equal to the name of the pilot's planet defined above.
 - Example:
 `system.stop2 = planet`
 */
system.stop2 = planet
/*:
 11. Let's get the directions for our journey. Create a `directions` variable, and set it equal to `system.loadDirections()`.
 - Example:
 `let directions = system.loadDirections()`
 */
let directions = system.loadDirections()
/*:
 12. Fill in the `Comment Template` below, then **scroll up you see this sentance at the top of the screen**(and your code is hidden).
 */
//
//****************
//Comment Template
//****************
//variable: stop1
//type: String
//reference: the name of the navigator's planet
//-----
//variable: directions
//type: Directions
//reference: the route the rocket will be taking to get to each stop
/*:
 
 ### Pilot, take the keyboard!
 13. Let's give our rocket those directions!
 Set `rocket.directions` equal to the variable referring to the rocket's route, made by your teammate!
 - Example:
 `rocket.directions = directions`
 */
rocket.directions = directions
/*:
 14. Have the rocket start guiding you on your jouney by calling `rocket.startNavigation()`.
 - Example:
 `rocket.startNavigation()`
 */
rocket.startNavigation()
/*:
 15. Now call the navigator over and watch the rocket blast off by running the playground!
 */
rocket.blastOff()
/*:
 
 ## Credits
 
 ### Songs
 * "Star Wars Main Title and Arrival at Naboo" - London Symphony Orchestra, London Voices, & New London Children's Chior
 * "Minions - Banana Song" - Dream Soundtracks
 * "Star Trek: The Next Generation - Main Title" - Dennis McCarthy, Jerry Goldsmith
 * "Theme from 001(Also Spracht Zarathustra)" - London Philharmonic Orchestra
 
 ### Code
 * "SKButtonNode" (https://github.com/bajtyngier/SKButtonNode/blob/master/SKButtonNode/SKButtonNode/SKButtonNode.swift) - Konrad Bajtyngier
 */


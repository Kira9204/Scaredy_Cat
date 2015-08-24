Scaredycat
------------
----------
This is a simple terminal application the allows you to play the game "Scaredycat"
It is a refresh of an old assignment of mine that i found to be a great start at learning the SWIFT
programming language. Even for a simple game, you need to learn good design and exception handling.

**Game rules:**
**Contents:**
40 bird cards, 6 scarecrow picture cards, 3 cat cards.

**Object**
To collect the most birds before the scarecrow is pieced together.

**To play**

 - Shuffle the cards and place them face downwards in a pile.
 - The youngest player begins by taking a card from the top of the pile.
 - If the player has taken a bird card, then they place it in front of them.
 - If the card shows part of the scarecrow, the player places it face upwards in the center of the table. N.B. As the game progresses and other scarecrow cards are turned over, they should be placed togehter to orm a picture of the scarecrow.
 - If it is a cat card, the plater must return all of their bird cards, togehter with the cat card, to the pile. The pile is then re-shuffled and play continues.
 - The game continues until the picture fo the scarecrow is complete. Players then count the number of birds on their cards.

**The winner**
The winner is the player with the most birds at the end of the game.

----------
Requirements
------------
----------
 - Any desktop plattform that supports SWIFT 2 (currently only OS X 10.10)

----------
Usage
-----
----------
Since relative paths were an issue at the time this was written (OS X refused legit relative paths),
You will need to change the
`static let path = "/Users/erik/Documents/Programming/Scarecrow/Scarecrow"`
into where you put the base game. Hopefullt this will get resoled when SWIFT 2 is out from early beta.

----------



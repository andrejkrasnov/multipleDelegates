//
//  Dice.swift
//  multipleDelegates
//
//  Created by Krasnov Andrey on 29.10.2020.
//

import Foundation

protocol RandomNumberGenerator {
    func random() -> Double
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    var nameTracker: String
    var square = 0
    var isEnd = false
    
    init(name: String) {
        self.nameTracker = name
    }
    
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders for \(nameTracker)")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("\(nameTracker) rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        isEnd = true
        print("The game lasted for \(numberOfTurns) turns by \(nameTracker)")
    }
}

 class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

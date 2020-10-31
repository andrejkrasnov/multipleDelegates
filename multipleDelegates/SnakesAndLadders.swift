//
//  SnakesAndLadders.swift
//  multipleDelegates
//
//  Created by Krasnov Andrey on 29.10.2020.
//

import Foundation



class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegates: [DiceGameTracker]?
    
    func play() {
        
        delegates?.forEach {
            $0.gameDidStart(self)
        }
        gameLoop: while !checkTrackersIsEnd(
                            isEnd: delegates![delegates!.count - 1].isEnd,
                            index: delegates!.count - 1) {
            diceRoll: for tracker in delegates! {
                    let diceRoll = dice.roll()
                    tracker.game(self, didStartNewTurnWithDiceRoll: diceRoll)
                    switch tracker.square + diceRoll {
                    case finalSquare:
                        tracker.gameDidEnd(self)
                        break diceRoll
                    case let newSquare where newSquare > finalSquare: 
                         continue diceRoll
                    default:
                        tracker.square += diceRoll
                        tracker.square += board[square]
                    }
                }
            }
        }
    
    func checkTrackersIsEnd(isEnd: Bool, index: Int) -> Bool {
        guard index > 0 else { return isEnd }
        return isEnd || checkTrackersIsEnd(isEnd: delegates![index - 1].isEnd, index: index - 1)
    }
}

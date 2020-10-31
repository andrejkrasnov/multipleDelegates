//
//  DiceTest.swift
//  multipleDelegatesTests
//
//  Created by Krasnov Andrey on 29.10.2020.
//
import Foundation
import XCTest

@testable import multipleDelegates

class DiceTest: XCTestCase {

    func testExample() {
        let tracker1 = DiceGameTracker(name: "John")
        let tracker2 = DiceGameTracker(name: "Andrey")
        let tracker3 = DiceGameTracker(name: "Mark")
        let game = SnakesAndLadders()
        game.delegates = [tracker1, tracker2, tracker3]
        game.play()
    }

}

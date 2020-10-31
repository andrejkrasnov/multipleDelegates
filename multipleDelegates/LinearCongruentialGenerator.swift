//
//  LinearCongruentialGenerator.swift
//  multipleDelegates
//
//  Created by Krasnov Andrey on 29.10.2020.
//

import Foundation

 class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

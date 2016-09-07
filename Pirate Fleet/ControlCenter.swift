//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        // Write your code here!
        
        let mediumShip1 = Ship(length: 2, location: GridLocation(x:0, y:0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x:2, y:2), isVertical: false)
        let mediumShip3 = Ship(length: 3, location: GridLocation(x:4, y:4), isVertical: false)
        let mediumShip4 = Ship(length: 4, location: GridLocation(x:2, y:3), isVertical: false)
        let mediumShip5 = Ship(length: 5, location: GridLocation(x:1, y:1), isVertical: false)
        
        
        
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(mediumShip3)
        human.addShipToGrid(mediumShip4)
        human.addShipToGrid(mediumShip5)
        
        let mine1 = Mine(location: GridLocation(x: 1, y:2), explosionText: "Exploded by mine 1")
        let mine2 = Mine(location: GridLocation(x: 3, y:4), explosionText: "Exploded by mine 2")

        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)

        
    }
    

    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        finalScore = 0
        
        
        var enemyShipsSunk = 5 - gameStats.enemyShipsRemaining
        var sinkBonus = gameStats.shipBonus
        var humanShipsRemaining = 5 - gameStats.humanShipsSunk
        var shipBonus = gameStats.shipBonus
        var numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        
        var guessPenalty = gameStats.guessPenalty
        
        finalScore = (enemyShipsSunk * sinkBonus) + (humanShipsRemaining * shipBonus) - (numberOfGuesses * guessPenalty)
        
        print("the value of final score is \(finalScore)")
        
        return finalScore
    }
}
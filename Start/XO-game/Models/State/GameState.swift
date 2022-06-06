//
//  GameState.swift
//  XO-game
//
//  Created by Аня on 06.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

public protocol GameState {
    
    var isCompleted: Bool { get }
    
    func begin()
    
    func addMark(at position: GameboardPosition)
}

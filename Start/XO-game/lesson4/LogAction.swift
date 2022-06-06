//
//  LogAction.swift
//  XO-game
//
//  Created by Аня on 01.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

enum LogAction {
    case playerInput(play: Player, position: GameboardPosition)
    case gameFinished(winner: Player?)
    case restartGame
}

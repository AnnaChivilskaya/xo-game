//
//  PlayerInputState.swift
//  XO-game
//
//  Created by Аня on 01.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

public class PlayerInputState: GameState {
    
    let markViewPrototype:  MarkView
    
    private(set) var isCompleted = false
    
    let player: Player
    
    private(set) weak var gameViewController: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    init(player: Player, gameViewController: GameViewController, gameboard: Gameboard, gameboardView: GameboardView, markViewPrototype: MarkView) {
        
        self.player = player
        self.gameViewController = gameViewController
        self.gameboard = gameboard
        self.gameboardView = gameboardView
        self.markViewPrototype = markViewPrototype
    }
    
    public func begin() { switch self.player {
    case .first:
        self.gameViewController?.firstPlayerTurnLabel.isHidden = false
        self.gameViewController?.secondPlayerTurnLabel.isHidden = true
    case .second:
        self.gameViewController?.firstPlayerTurnLabel.isHidden = true
        self.gameViewController?.secondPlayerTurnLabel.isHidden = false
    }
        self.gameViewController?.winnerLabel.isHidden = true
    }
    
    public func addMark(at position: GameboardPosition) {
        log(.playerInput(play: player, position: position))
        
        guard let gameboardView = self.gameboardView,
              gameboardView.canPlaceMarkView(at: position)
        else { return }
        
        
        
        self.gameboard?.setPlayer(self.player, at: position)
        self.gameboardView?.placeMarkView(markViewPrototype.copy(), at: position)
        self.isCompleted = true
    }
    
}

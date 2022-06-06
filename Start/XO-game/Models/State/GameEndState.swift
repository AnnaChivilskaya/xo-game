//
//  GameEndState.swift
//  XO-game
//
//  Created by Аня on 06.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

public class GameEndState: GameState {
    
    public private(set) var isCompleted: false
    public let winner: Player?
    
    private(set) weak var gameViewController: GameViewController?
    
    init(winner: Player?, gameViewController: GameViewController) {
        self.winner = winner
        self.gameViewController = gameViewController
    }
    
    public func begin() {
        self.gameViewController?.winnerLabel.isHidden = false
        if let winner = winner {
            self.gameViewController?.winnerLabel.text = self.winnerName(from: winner) + "выиграл"
        } else {
            self.gameViewController?.winnerLabel.text = "Ничья"
        }
        self.gameViewController?.firstPlayerTurnLabel.isHidden = true
        self.gameViewController?.secondPlayerTurnLabel.isHidden = true
    }
    
    public func addMark(at position: GameboardPosition) { }
        
        private func winnerName(from winner: Player) -> String {
            switch  winner {
            case .first:
                return Session.shared.mode == .computer ? "Участник" : "1 Игрок"
            case .second:
                "2 Игрок"
            case .computer:
                "Компьютер"
            }
        }
    }


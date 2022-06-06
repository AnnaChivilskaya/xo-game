//
//  FiveByFiveState.swift
//  XO-game
//
//  Created by Аня on 06.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

class FiveToFiveState: GameState {
    
    var isCompleted: Bool = false
    public let player: Player
    private weak var gameViewController: GameViewController?
    private weak var gameBoard: Gameboard?
    private weak var gameBoardView: GameboardView?
    
    var counter = 0

    public let markviewPrototype: MarkView

    init(player: Player, gameViewController: GameViewController,
         gameBoard: Gameboard, gameBoardView: GameboardView, markViewPrototype: MarkView) {
        self.player = player
        self.gameViewController = gameViewController
        self.gameBoard = gameBoard
        self.gameBoardView = gameBoardView
        self.markviewPrototype = markViewPrototype
    }

    func begin() {
        switch player {
        case .first:
            gameViewController?.firstPlayerTurnLabel.isHidden = false
            gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .second, .computer:
            gameViewController?.firstPlayerTurnLabel.isHidden = true
            gameViewController?.secondPlayerTurnLabel.isHidden = false
        }

        gameViewController?.winnerLabel.isHidden = true
    }

    func addMark(at position: GameboardPosition) {
        log(.playerInput(play: player, position: position))

        guard let gameBoardView = gameBoardView,
              gameBoardView.canPlaceMarkView(at: position) else {
            return
        }

        gameBoard?.setPlayer(player, at: position)
        gameBoardView.placeMarkView(markviewPrototype.copy(), at: position)
        
        if player == .first {
            Session.shared.PlayerFirst.append(PlayerMove(player: .first, position: position))
        } else {
            Session.shared.PlayerSecond.append(PlayerMove(player: .second, position: position))
        }
        
        counter += 1
        if counter >= 5 { isCompleted = true }
    }
}

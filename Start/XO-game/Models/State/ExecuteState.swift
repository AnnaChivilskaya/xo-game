//
//  ExecuteState.swift
//  XO-game
//
//  Created by Аня on 06.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

class GameExecuteState: GameState {

    var isCompleted: Bool = false
    private weak var gameViewController: GameViewController?
    private weak var gameBoard: Gameboard?
    private weak var gameBoardView: GameboardView?
    private var player: Player = .first
    private var timer: Timer?
    var completionHandler: () -> Void
    
    init(gameViewController: GameViewController, gameBoard: Gameboard, gameBoardView: GameboardView, _ completionHandler: @escaping () -> Void) {
        self.gameViewController = gameViewController
        self.gameBoard = gameBoard
        self.gameBoardView = gameBoardView
        self.completionHandler = completionHandler
    }
    
    @objc func performMove() {
        if Session.shared.PlayerFirst.count > 0 || Session.shared.PlayerSecond.count > 0 {
            var move: PlayerMove?
            
            if player == .first {
                move = Session.shared.PlayerSecond.removeFirst()
                gameViewController?.firstPlayerTurnLabel.isHidden = false
                gameViewController?.secondPlayerTurnLabel.isHidden = true
                
            } else {
                move = Session.shared.PlayerSecond.removeFirst()
                gameViewController?.firstPlayerTurnLabel.isHidden = true
                gameViewController?.secondPlayerTurnLabel.isHidden = false
            }
            
            if let move = move {
                addMark(at: move.position)
                player = player.next
            }
            
        } else {
            timer?.invalidate()
            completionHandler()
        }
    }
    
    func begin() {
        timer = Timer.scheduledTimer(timeInterval: 0.75,
                                     target: self,
                                     selector: #selector(performMove),
                                     userInfo: nil, repeats: true)
    }
    
    func addMark(at position: GameboardPosition) {
        guard let gameBoardView = gameBoardView else { return }
        
        gameBoard?.setPlayer(player, at: position)
        
        if !gameBoardView.canPlaceMarkView(at: position) {
            gameBoardView.removeMarkView(at: position)
        }
        
        gameBoardView.placeMarkView(player.markviewPrototype.copy(), at: position)
    }
}

//
//  MainMenuViewController.swift
//  XO-game
//
//  Created by Аня on 06.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import UIKit
    
    enum GameMode {
        case twoPlayers
        case computer
        case fiveByFive
    
}
class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var twoPlayer: UIButton!
    @IBOutlet weak var computerPlayer: UIButton!
    @IBOutlet weak var FiveByFive: UIButton!
    
    
    @IBAction func twoPlayerButton(_ sender: Any) {
        Session.shared.mode = .twoPlayers
        performSegue(withIdentifier: "startGame", sender: self)
    }
    
    
    @IBAction func computerPlayerButton(_ sender: Any) {
        Session.shared.mode = .computer
        performSegue(withIdentifier: "startGame", sender: self)
    }
    
    
    @IBAction func fiveByFivePutton(_ sender: Any) {
        Session.shared.mode = .fiveByFive
        performSegue(withIdentifier: "startGame", sender: self)
    }
}

//
//  Session.swift
//  XO-game
//
//  Created by Аня on 06.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import UIKit

final class Session {
    
    static let shared = Session()
    private init() { }
    
    var mode: GameMode?
    
    var PlayerFirst: [PlayerMove] = []
    var PlayerSecond: [PlayerMove] = []
}

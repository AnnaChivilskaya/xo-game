//
//  Invoker.swift
//  XO-game
//
//  Created by Аня on 02.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

func log(_ action: LogAction)  {
    let command = LogCommand(action: action)
    LoggerInvoker.shared.addLogCommand(command)
}

    class LoggerInvoker {
    
    static let shared = LoggerInvoker()
    
    private let logger = Logger()
    private let batchSize = 10
    private var commands: [LogCommand] = []
    
     func addLogCommand(_ command: LogCommand) {
        commands.append(command)
        executeCommandsIfNeeded()
    }
    
     func executeCommandsIfNeeded() {
        guard commands.count >= batchSize else {
            return
        }
        commands.forEach { logger.writeMessageToLog($0.logMessage) }
        commands = []
    }
}


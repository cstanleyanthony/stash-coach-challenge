// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
import os

/// A logger to log messages to the console and the system.
struct LoggerService {
    
    private static let defaultSubSystem = "com.stashcoach.app"
    
    /// Log a message without an interpolated value.
    static func log(subSystem: String = defaultSubSystem,
                    category: String,
                    level: OSLogType = .default,
                    message: String) {
        
        let logger = Logger(subsystem: subSystem, category: category)
        
        logger.log(level: level, "\(message)")
    }
    
    /// Log a message with an interpolated public value.
    /// - Important: The value will be public, ensure there is no sensitive information.
    static func log(subSystem: String = defaultSubSystem,
                    category: String,
                    level: OSLogType = .default,
                    message: String,
                    value: String) {
        
        let logger = Logger(subsystem: subSystem, category: category)
        logger.log(level: level, "\(message) \(value, privacy: .public)")
    }
}

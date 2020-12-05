// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
import os

struct LoggerService {
    
    static func log(subSystem: String = "com.stashcoach.app",
                    category: String,
                    level: OSLogType = .default,
                    message: String) {
        
        let logger = Logger(subsystem: subSystem, category: category)
        
        logger.log(level: level, "\(message)")
    }
}

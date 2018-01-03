//
//  Logger.swift
//  Logger
//
//  Created by Naver on 2017. 12. 23..
//  Copyright © 2017년 MashUp. All rights reserved.
//

import Foundation
import XCGLogger

public protocol Logger {

    var logger: XCGLogger { get }

    func setupLogger()
}

extension Logger {

    public var logger: XCGLogger {
        return XCGLogger.default
    }

    public func setupLogger() {
        logger.setup(level: .debug, showLogIdentifier: false, showFunctionName: true, showThreadName: false, showLevel: true, showFileNames: true, showLineNumbers: true, showDate: false, writeToFile: nil, fileLevel: nil)
    }
}

extension NSObject: Logger { }

//
//  JailbreakDetector.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import UIKit

final class JailbreakDetector: JailbreakDetecting {

    func isJailbroken() -> Bool {
        #if targetEnvironment(simulator)
        return false
        #endif

        for path in SecurityConstants.jailbreakPaths {
            if FileManager.default.fileExists(atPath: path) {
                return true
            }
        }

        return canWriteOutsideSandbox()
    }

    private func canWriteOutsideSandbox() -> Bool {
        let testPath = SecurityConstants.jailbreakTestFilePath

        do {
            try "test".write(
                toFile: testPath,
                atomically: true,
                encoding: .utf8
            )
            try FileManager.default.removeItem(atPath: testPath)
            return true
        } catch {
            return false
        }
    }
}

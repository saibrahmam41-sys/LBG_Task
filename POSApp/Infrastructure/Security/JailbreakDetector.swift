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

        let jailbreakPaths = [
            "/Applications/Cydia.app",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt"
        ]

        for path in jailbreakPaths {
            if FileManager.default.fileExists(atPath: path) {
                return true
            }
        }

        if canWriteOutsideSandbox() {
            return true
        }

        return false
    }

    private func canWriteOutsideSandbox() -> Bool {
        let testPath = "/private/jailbreak_test.txt"
        do {
            try "test".write(toFile: testPath, atomically: true, encoding: .utf8)
            try FileManager.default.removeItem(atPath: testPath)
            return true
        } catch {
            return false
        }
    }
}

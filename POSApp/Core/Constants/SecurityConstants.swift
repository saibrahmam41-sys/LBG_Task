//
//  SecurityConstants.swift
//  POSApp
//
//  Created by Eswar Ancha on 09/01/26.
//

enum SecurityConstants {

    static let jailbreakPaths: [String] = [
        "/Applications/Cydia.app",
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/bin/bash",
        "/usr/sbin/sshd",
        "/etc/apt"
    ]

    static let jailbreakTestFilePath = "/private/jailbreak_test.txt"
}

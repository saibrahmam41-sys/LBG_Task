//
//  MockJailbreakDetector.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//
@testable import POSApp
final class MockJailbreakDetector: JailbreakDetecting {

    let jailbroken: Bool

    init(jailbroken: Bool) {
        self.jailbroken = jailbroken
    }

    func isJailbroken() -> Bool {
        jailbroken
    }
}

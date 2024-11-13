//
//  UserDefautsManager.swift
//  Horus
//
//  Created by Gabriel Castillo Serafim on 10/11/24.
//

import Foundation

fileprivate enum UserDefaultKeys: String {
    case authToken
}

final class UserDefautsManager {
    
    // MARK: - Singleton instance
    
    static let shared = UserDefautsManager()
    private init() {}
    
    // MARK: - Properties
    
    private let lock = NSLock()
    
    // MARK: - Public API
    
    var userAuthToken: String? {
        get {
            getValue(forKey: .authToken) as? String
        }
        set {
            setValue(newValue, forKey: .authToken)
        }
    }
    
    // MARK: - Private API
    
    private func setValue(_ value: Any?, forKey key: UserDefaultKeys) {
        lock.lock()
        defer { lock.unlock() }
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    private func getValue(forKey key: UserDefaultKeys) -> Any? {
        lock.lock()
        defer { lock.unlock() }
        return UserDefaults.standard.object(forKey: key.rawValue)
    }
}

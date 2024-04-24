//
//  UserDefaultsCache.swift
//  SeekMax
//
//  Created by Sunil Maurya on 24/04/24.
//


import Foundation

extension UserDefaults: Cache {

    public subscript<Type>(key: CacheKey<Type>) -> Type? {
        get { return load(key: key) }
        set {
            guard let value = newValue else {
                delete(key: key)
                return
            }
            save(key: key, value: value)
        }
    }

    public func save<Type>(key storageKey: CacheKey<Type>, value: Type) {
        set(value, forKey: storageKey.rawValue)
    }

    public func load<Type>(key storageKey: CacheKey<Type>) -> Type? {
        return object(forKey: storageKey.rawValue) as? Type
    }

    public func delete<Type>(key storageKey: CacheKey<Type>) {
        removeObject(forKey: storageKey.rawValue)
    }

}

extension UserDefaults {

    static func isAlreadyLoggedIn() -> Bool {
        let cache: Cache = UserDefaults.standard
        guard let loginState = cache.load(key: .isAlreadyLoggedin) else {
            return false
        }
        return loginState
    }
}

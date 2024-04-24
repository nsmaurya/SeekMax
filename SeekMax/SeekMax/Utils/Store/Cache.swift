//
//  Cache.swift
//  SeekMax
//
//  Created by Sunil Maurya on 24/04/24.
//

import Foundation

protocol Cache: AnyObject {

    /// Get and set value for given CacheKey
    subscript<Type>(_ key: CacheKey<Type>) -> Type? { get set }

    /// Save value for CacheKey in cache
    func save<Type>(key storageKey: CacheKey<Type>, value: Type)

    /// Load value for CacheKey in cache
    func load<Type>(key storageKey: CacheKey<Type>) -> Type?

    /// Delete entry for CacheKey in cache
    func delete<Type>(key storageKey: CacheKey<Type>)

}

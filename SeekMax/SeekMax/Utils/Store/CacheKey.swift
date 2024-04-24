//
//  CacheKey.swift
//  SeekMax
//
//  Created by Sunil Maurya on 24/04/24.
//


import Foundation

public struct CacheKey<Type>: ExpressibleByStringLiteral {

    public let rawValue: String

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

}

extension CacheKey {
    static var isAlreadyLoggedin: CacheKey<Bool> { "isAlreadyLoggedin" }
}

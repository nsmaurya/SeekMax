//
//  ViewState.swift
//  SeekMax
//
//  Created by Sunil Maurya on 24/04/24.
//

import Foundation

enum ViewState<T> {
    case empty
    case loading
    case ready(T)
    case error(Error)

    var isLoading: Bool {
        switch self {
        case .loading : return true
        default: return false
        }
    }
}

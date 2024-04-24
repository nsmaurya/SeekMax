//
//  ProfileTabViewModel.swift
//  SeekMax
//
//  Created by Sunil Maurya on 24/04/24.
//

import Foundation

class ProfileTabViewModel {
    // MARK: - Success states
    enum State {
        case logout
    }

    // MARK: - View state
    var viewState: ViewState<State> = .empty {
        didSet {
            DispatchQueue.main.async {
                self.onViewStateChange?(self.viewState)
            }
        }
    }

    var onViewStateChange: ((_ viewState: ViewState<State>) -> Void)?
    
    func logout() {
        //self.viewState = .loading //show loader
        //TODO:: Perform actions before logout
        let cache: Cache = UserDefaults.standard
        cache.save(key: .isAlreadyLoggedin, value: false)
        self.viewState = .ready(.logout)
    }
}

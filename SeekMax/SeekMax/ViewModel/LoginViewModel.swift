//
//  LoginViewModel.swift
//  SeekMax
//
//  Created by Sunil Maurya on 23/04/24.
//

import Foundation

class LoginViewModel {
    
    // MARK: - Success states
    enum State {
        case emailErrorUI(isValid: Bool)
        case passwordErrorUI(isValid: Bool)
        case loginSuccessful
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
    private(set) var email: String?
    private(set) var password: String?
    
    func isValidEmail() -> Bool {
        return email?.isValidEmail() == true
    }
    
    func validateInputs() -> Bool {
        guard email?.isValidEmail() == true else {
            return false
        }
        
        guard password != nil && password?.isEmpty == false && password?.isValidPassword() == true  else {
            return false
        }
        
        return true
    }
    
    func setEmail(_ text: String?) {
        email = text
        self.viewState = .ready(.emailErrorUI(isValid: email?.isValidEmail() == true))
    }
    
    func setPassword(_ text: String?) {
        password = text
        self.viewState = .ready(.passwordErrorUI(isValid: password == nil || password?.isEmpty == true || password?.isValidPassword() == true ))
    }
}

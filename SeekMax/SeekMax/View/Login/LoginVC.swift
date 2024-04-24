//
//  LoginVC.swift
//  SeekMax
//
//  Created by Sunil Maurya on 22/04/24.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var emailErrorLabel: CaptionLabel!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var passwordErrorLabel: CaptionLabel!
    @IBOutlet private var loginButton: PrimaryButtonFilled!

    // MARK: - SB init
    static func instance(_ interactor: LoginViewModel) -> LoginVC {
        let loginVC = Storyboard.main.instantiateVC(LoginVC.self)
        loginVC.viewModel = interactor
        return loginVC
    }

    private var viewModel: LoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.bgBrand
        loginButton.isEnabled = viewModel.validateInputs()
        observeViewState()
    }
    
    private func observeViewState() {
        self.viewModel.onViewStateChange = { _ in
            self.onStateChange()
        }
        onStateChange()
    }

    // MARK: - View state change
    private func onStateChange() {

        if viewModel.viewState.isLoading {
            print("Show Loader...")
        } else {
            print("Hide Loader if visible...")
        }

        switch viewModel.viewState {
        case .empty:
            break
        case .ready(let status):
            switch status {
            case .loginSuccessful:
                self.showAlertViewWithMessageAndActionHandler("SeekMax", message: "Login successful.") {
                    SceneDelegate.loadHomePage()
                }
            case .emailErrorUI(isValid: let isValid):
                emailErrorLabel.isHidden = isValid
                loginButton.isEnabled = viewModel.validateInputs()
            case .passwordErrorUI(isValid: let isValid):
                passwordErrorLabel.isHidden = isValid
                loginButton.isEnabled = viewModel.validateInputs()
            }
        case .error(let error):
            print("Failed:::\(error.localizedDescription)")
        default:
            break
        }
    }
    
    // MARK: - Actions
    @IBAction private func loginButtonTapped(_ sender: Any) {
        viewModel.login()
    }
    
    @IBAction private func passwordFieldTextChanged(_ sender: Any) {
        viewModel.setPassword(passwordTextField.text)
    }
    
    @IBAction private func emailFieldTextChanged(_ sender: Any) {
        viewModel.setEmail(emailTextField.text)
    }
}

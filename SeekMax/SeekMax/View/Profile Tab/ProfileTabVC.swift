//
//  ProfileTabVC.swift
//  SeekMax
//
//  Created by Sunil Maurya on 24/04/24.
//

import UIKit

class ProfileTabVC: UIViewController {

    // MARK: - SB init
    static func instance(_ interactor: ProfileTabViewModel) -> ProfileTabVC {
        let profileTabVC = Storyboard.main.instantiateVC(ProfileTabVC.self)
        profileTabVC.viewModel = interactor
        return profileTabVC
    }

    private var viewModel: ProfileTabViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
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
            case .logout:
                SceneDelegate.loadLoginPage()
            }
        case .error(let error):
            print("Failed:::\(error.localizedDescription)")
        default:
            break
        }
    }
    
    // MARK: - Actions
    @IBAction private func logoutButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(
            title: "SeekMax",
            message: "Are you sure you want to logout?",
            preferredStyle: .alert
        )
        alertController.view.tintColor = UIColor.black
        let notNowAction = UIAlertAction(title: "Not Now", style: .default) { (_) in }
        alertController.addAction(notNowAction)
        let enableAction = UIAlertAction(title: "Logout", style: .default) { (_) in
            self.viewModel.logout()
        }
        alertController.addAction(enableAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

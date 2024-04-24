//
//  SceneDelegateExtension.swift
//  SeekMax
//
//  Created by Sunil Maurya on 24/04/24.
//

import Foundation
import UIKit

extension SceneDelegate {
    static func setRoot(viewController: UIViewController) {
        guard let window = delegate?.window else { return }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    static var delegate: SceneDelegate? {
        UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
    }

    static func loadHomePage() {
        let rootVC = RootVC.instance()
        self.setRoot(viewController: rootVC)
    }

    static func loadLoginPage() {
        let loginVC = LoginVC.instance(LoginViewModel())
        self.setRoot(viewController: loginVC)
    }
}

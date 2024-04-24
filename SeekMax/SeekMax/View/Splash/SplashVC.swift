//
//  SplashVC.swift
//  SeekMax
//
//  Created by Sunil Maurya on 22/04/24.
//

import UIKit

class SplashVC: UIViewController {
    private var isLoggedIn = false
    override func viewDidLoad() {
        super.viewDidLoad()
        let cache: Cache = UserDefaults.standard
        isLoggedIn = cache.load(key: .isAlreadyLoggedin) ?? false
        self.view.backgroundColor = UIColor.bgBrand
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            self.loadUI()
        })
    }

    private func loadUI() {
        if isLoggedIn {
            SceneDelegate.loadHomePage()
        } else {
            SceneDelegate.loadLoginPage()
        }
    }
}


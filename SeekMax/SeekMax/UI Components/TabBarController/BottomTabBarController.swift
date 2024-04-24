//
//  BottomTabBarController.swift
//  SeekMax
//
//  Created by Sunil Maurya on 24/04/24.
//

import UIKit

class BottomTabBarController: UITabBarController {

    private enum Constants {
        static let shadowRadius: CGFloat = 8
        static let shadowOpacity: Float = 0.2
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.delegate = self
        // Remove default line
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.backgroundColor = .cardBackground

        // Add only shadow
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.tabBar.layer.shadowRadius = Constants.shadowRadius
        self.tabBar.layer.shadowColor = UIColor.textSecondary.cgColor
        self.tabBar.layer.shadowOpacity = Constants.shadowOpacity
        self.tabBar.tintColor = .backgroundBrand
        self.tabBar.unselectedItemTintColor = .textSecondary
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
}

extension BottomTabBarController: UITabBarControllerDelegate {

    func tabBarController(
        _ tabBarController: UITabBarController,
        didSelect viewController: UIViewController
    ) {

        
    }
}

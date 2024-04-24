//
//  RootVC.swift
//  SeekMax
//
//  Created by Sunil Maurya on 24/04/24.
//

import UIKit

class RootVC: UIViewController {

    // MARK: - SB init
    static func instance() -> RootVC {
        let rootVC = Storyboard.main.instantiateVC(RootVC.self)
        return rootVC
    }
    
    private var navController: UINavigationController?
    private lazy var tabController = BottomTabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        navController?.view.frame = self.view.bounds
    }
    
    // MARK: - Setup methods
    func setup() {
        setupBottomTabs()

        let navController = UINavigationController(rootViewController: tabController)

        self.addChild(navController)
        self.view.addSubview(navController.view)
        navController.didMove(toParent: self)
        self.navController = navController
    }

    func setupBottomTabs() {
        let homeVC = UIViewController()
        homeVC.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "housed.filled")
        )
        let profileTabVC = ProfileTabVC.instance(ProfileTabViewModel())
        profileTabVC.tabBarItem = UITabBarItem(
            title: "My Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.filled")
        )
        tabController.viewControllers = [homeVC, profileTabVC]
    }
}

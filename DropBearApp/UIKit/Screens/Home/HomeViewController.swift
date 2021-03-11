//
//  HomeViewController.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {
    // MARK: - Lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)

        let list = ListNavigationController()
        list.tabBarItem = .init(title: "List", image: nil, tag: 0)

        let settings = SettingsNavigationController()
        settings.tabBarItem = .init(title: "Settings", image: nil, tag: 0)

        setViewControllers([list, settings], animated: false)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.accessibilityIdentifier = "tabBar"
    }
}

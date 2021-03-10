//
//  SettingsNavigationController.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import UIKit

class SettingsNavigationController: UINavigationController {
    // MARK: - Lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)

        let viewModel = SettingsViewModel(session: Dependencies.session)
        let viewController = SettingsViewController(viewModel: viewModel)
        viewController.title = "Settings"

        setViewControllers([viewController], animated: false)
    }
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

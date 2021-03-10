//
//  LoadingViewController.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    // MARK: - Private
    private let viewModel: LoadingViewModel

    // MARK: - Lifecycle
    init(viewModel: LoadingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        asyncAfter(1.5) { [unowned self] in
            viewModel.start()
        }
    }
}

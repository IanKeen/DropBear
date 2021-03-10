//
//  LoginViewController.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import UIKit

class LoginViewController: UIViewController {
    // MARK: - Private Properties
    private let viewModel: LoginViewModel
    private var bindings = Set<AnyCancellable>()

    // MARK: - IBOutlets
    @IBOutlet private var username: UITextField!
    @IBOutlet private var password: UITextField!
    @IBOutlet private var button: UIButton!
    @IBOutlet private var indicator: UIActivityIndicatorView!

    // MARK: - Lifecycle
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        bindings = [
            username.bind(to: viewModel.$username),
            password.bind(to: viewModel.$password),
            button.bind(to: viewModel.$login),

            viewModel.objectDidChange.sink(receiveValue: weak(self) { this, _ in
                this.updateFromViewModel()
            })
        ]

        updateFromViewModel()
    }

    // MARK: - Private
    private func updateFromViewModel() {
        button.isEnabled = viewModel.allowLogin && !viewModel.isWorking
        username.isEnabled = !viewModel.isWorking
        password.isEnabled = !viewModel.isWorking

        indicator.isHidden = !viewModel.isWorking

        if let error = viewModel.error.wrappedValue {
            showError(error)
        }
    }
}

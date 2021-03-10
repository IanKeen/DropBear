//
//  SettingsViewController.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import UIKit

class SettingsViewController: UIViewController {
    // MARK: - Private Properties
    private let viewModel: SettingsViewModel
    private var bindings = Set<AnyCancellable>()

    // MARK: - IBOutlet
    @IBOutlet private var logOut: UIButton!

    // MARK: - Lifecycle
    init(viewModel: SettingsViewModel) {
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
            logOut.bind(to: viewModel.$logOut, confirm: weak(self, SettingsViewController.confirmLogOut)),
            viewModel.objectDidChange.sink(receiveValue: weak(self) { this, _ in
                this.updateFromViewModel()
            })
        ]
    }

    // MARK: - Private
    private func confirmLogOut(_ complete: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "Confirm", message: "Are you sure?", preferredStyle: .alert)
        alert.addAction(.init(title: "Yes", style: .destructive, handler: { _ in complete(true) }))
        alert.addAction(.init(title: "No", style: .cancel, handler: { _ in complete(false) }))
        topMostViewController.present(alert, animated: true, completion: nil)
    }
    private func updateFromViewModel() {
        logOut.isEnabled = !viewModel.isWorking

        if let error = viewModel.error.wrappedValue {
            showError(error)
        }
    }
}

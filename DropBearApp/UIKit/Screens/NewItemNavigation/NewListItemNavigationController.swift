//
//  NewItemNavigationController.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import UIKit

class NewListItemNavigationController: UINavigationController {
    // MARK: - Private
    private let viewModel: NewListItemViewModel
    private var bindings = Set<AnyCancellable>()
    private let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(save))
    private let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dismissNewItem))

    // MARK: - Lifecycle
    init(viewModel: NewListItemViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

        let viewController = NewListItemViewController(viewModel: viewModel)

        viewController.title = "Create New Item"
        viewController.navigationItem.leftBarButtonItem = cancelButton
        viewController.navigationItem.rightBarButtonItem = saveButton

        bindings = [
            viewModel.objectDidChange.sink(receiveValue: weak(self) { this, _ in
                this.updateFromViewModel()
            })
        ]

        updateFromViewModel()

        setViewControllers([viewController], animated: false)
    }
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private
    @objc private func save() {
        viewModel.$save()
    }
    private func updateFromViewModel() {
        saveButton.isEnabled = viewModel.allowSave && !viewModel.isWorking
        cancelButton.isEnabled = !viewModel.isWorking

        isModalInPresentation = viewModel.isWorking
    }
}

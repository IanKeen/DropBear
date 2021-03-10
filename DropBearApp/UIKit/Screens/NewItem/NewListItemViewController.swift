//
//  NewListItemViewController.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import UIKit

class NewListItemViewController: UIViewController {
    // MARK: - Private Properties
    private let viewModel: NewListItemViewModel
    private var bindings = Set<AnyCancellable>()

    // MARK: - IBOutlets
    @IBOutlet private var itemTitle: UITextField!
    @IBOutlet private var complete: UISwitch!
    @IBOutlet private var indicator: UIActivityIndicatorView!

    // MARK: - Lifecycle
    init(viewModel: NewListItemViewModel) {
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
            itemTitle.bind(to: viewModel.$title),
            complete.bind(to: viewModel.$complete),
            viewModel.objectDidChange.sink(receiveValue: weak(self) { this, _ in
                this.updateFromViewModel()
            })
        ]

        updateFromViewModel()

        itemTitle.becomeFirstResponder()
    }

    // MARK: - Private
    private func updateFromViewModel() {
        itemTitle.isEnabled = !viewModel.isWorking
        complete.isEnabled = !viewModel.isWorking
        indicator.isHidden = !viewModel.isWorking

        if let error = viewModel.error.wrappedValue {
            showError(error)
        }
    }
}

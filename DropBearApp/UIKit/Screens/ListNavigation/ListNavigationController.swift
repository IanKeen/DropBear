//
//  ListNavigationController.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import UIKit

class ListNavigationController: UINavigationController {
    // MARK: - Private
    private var bag = Set<AnyCancellable>()

    // MARK: - Lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)

        let viewModel = ListViewModel(repository: Dependencies.listItemRepository)
        let viewController = ListViewController(viewModel: viewModel)

        viewController.title = "Items"
        viewController.navigationItem.rightBarButtonItem = .init(title: "Add", style: .done, target: self, action: #selector(addItem))
        viewController.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "add"

        setViewControllers([viewController], animated: false)
    }
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func addItem() {
        let viewModel = NewListItemViewModel(repository: Dependencies.listItemRepository)
        let viewController = NewListItemNavigationController(viewModel: viewModel)

        viewModel
            .$didSave
            .filter { $0 }
            .debounce(for: 0.2, scheduler: DispatchQueue.main)
            .sink(receiveValue: weak(self) { this, _ in
                this.dismissNewItem()
            })
            .store(in: &bag)

        presentModal(viewController, animated: true)
    }
    override func dismissNewItem() {
        dismissModal(animated: true)
    }
    override func showItemDetails(_ box: ResponderBox) {
        let viewController = ListItemDetailsViewController(viewModel: box.value())

        switch Dependencies.itemDetailPresentationMode {
        case .push:
            pushViewController(viewController, animated: true)
        case .present:
            presentModal(viewController, animated: true)
        }
    }
}

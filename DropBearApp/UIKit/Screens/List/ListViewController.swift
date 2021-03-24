//
//  ListViewController.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import UIKit

class ListViewController: UITableViewController {
    // MARK: - Private Properties
    private let viewModel: ListViewModel
    private var bindings = Set<AnyCancellable>()

    // MARK: - Lifecycle
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        ListItemCell.register(with: tableView)
        tableView.estimatedRowHeight = 90
        tableView.accessibilityIdentifier = "tableView"

        refreshControl = UIRefreshControl()
        clearsSelectionOnViewWillAppear = false

        bindings = [
            refreshControl!.bind(to: viewModel.$refresh),

            viewModel.objectDidChange.sink(receiveValue: weak(self) { this, _ in
                this.updateFromViewModel()
            })
        ]

        viewModel.$refresh()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListItemCell.dequeue(from: tableView, at: indexPath)
        cell.configure(viewModel.items[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showItemDetails(viewModel.items[indexPath.row])
    }

    // MARK: - Private
    private func updateFromViewModel() {
        tableView.reloadData()

        if viewModel.isWorking {
            refreshControl?.beginRefreshing()
        } else {
            refreshControl?.endRefreshing()
        }

        if let error = viewModel.error.wrappedValue {
            showError(error)
        }
    }
}

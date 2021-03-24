//
//  ListItemDetailsViewController.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import UIKit

class ListItemDetailsViewController: UIViewController {
    // MARK: - Private Proprties
    private let viewModel: ListItemDetailsViewModel

    // MARK: - IBOutlet
    @IBOutlet private var date: UIDatePicker!

    // MARK: - Lifecycle
    init(viewModel: ListItemDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

        title = viewModel.title
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        date.date = viewModel.createdDate
        date.accessibilityIdentifier = "date"
    }
}

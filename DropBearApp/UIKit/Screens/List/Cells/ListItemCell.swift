//
//  ListItemCell.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import UIKit

class ListItemCell: UITableViewCell {
    // MARK: - Private Properties
    private var bindings = Set<AnyCancellable>()

    // MARK: - IBOutlet
    @IBOutlet private var title: UILabel!
    @IBOutlet private var check: UIImageView!
    @IBOutlet private var created: UILabel!

    func configure(_ viewModel: ListItemDetailsViewModel) {
        title.text = viewModel.title
        created.text = viewModel.created
        check.image = viewModel.completed
            ? UIImage(systemName: "checkmark.seal.fill")
            : nil
    }
}

extension ListItemCell {
    static func register(with tableView: UITableView) {
        tableView.register(UINib(nibName: "ListItemCell", bundle: nil), forCellReuseIdentifier: "ListItemCell")
    }
    static func dequeue(from tableView: UITableView, at indexPath: IndexPath) -> ListItemCell {
        tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath) as! ListItemCell
    }
}

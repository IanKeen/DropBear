//
//  ListItemDetailsViewModel.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import DomainKit

class ListItemDetailsViewModel {
    static let formatter: Formatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        formatter.unitsStyle = .spellOut
        return formatter
    }()

    let title: String
    let created: String
    let createdDate: Date
    let completed: Bool

    init(item: Identified<ListItem>) {
        self.title = item.title
        self.createdDate = item.createdOn
        self.created = Self.formatter.string(for: item.createdOn) ?? "<unknown>"
        self.completed = item.completed
    }
}

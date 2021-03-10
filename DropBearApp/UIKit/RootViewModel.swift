//
//  RootViewModel.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DomainKit
import Foundation

class RootViewModel: ObservableObject {
    enum State: Equatable {
        case loading
        case logIn
        case home
    }

    @Published private(set) var state: State = .loading

    init(session: Session) {
        session.publisher
            .withPrevious()
            .map { (prev, current) in
                switch (prev, current) {
                case (.loggedIn?, .loggedOut):
                    return .loading

                case (_, .loggedOut):
                    return .logIn

                case (_, .loggedIn):
                    return .home
                }
            }
            .removeDuplicates()
            .assign(to: &$state)
    }
}

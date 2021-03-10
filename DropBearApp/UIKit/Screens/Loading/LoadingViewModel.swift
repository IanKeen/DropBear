//
//  LoadingViewModel.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Foundation

class LoadingViewModel {
    private let session: Session

    init(session: Session) {
        self.session = session
    }

    func start() {
        session.restoreState()
    }
}

//
//  Publisher+Tracking.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import Foundation

class ActivityTracker {
    private let queue = DispatchQueue(label: "activity.tracker.queue")
    private var count = CurrentValueSubject<Int, Never>(0)

    fileprivate func inc() { queue.sync { count.value += 1 } }
    fileprivate func dec() { queue.sync { count.value = max(count.value - 1, 0) } }

    var publisher: AnyPublisher<Bool, Never> { count.map({ $0 > 0}).eraseToAnyPublisher() }
}

extension Publisher {
    func track(with tracker: ActivityTracker) -> AnyPublisher<Output, Failure> {
        return handleEvents(
            receiveSubscription: { _ in tracker.inc() },
            receiveCompletion: { _ in tracker.dec() },
            receiveCancel: { tracker.dec() }
        )
        .eraseToAnyPublisher()
    }
}


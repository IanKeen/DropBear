//
//  UIView+AsyncAfter.swift
//  DropBearSupport
//
//  Created by Ian Keen on 2021-03-03.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import UIKit

extension UIView {
    /// Insert a delay before performing an action
    ///
    /// - Note:
    ///     This code creates a delay using an 'empty' animation. The reason is so the delay can be speed up during UI tests.
    ///     If we use a `DispatchQueue.asyncAfter` we would need to add 'pauses' in the UI tests.
    ///     We use a UIView extension so this 'hack' is restricted to  _only_ the view layer.
    ///
    /// - Parameters:
    ///   - duration: Duration to wait
    ///   - complete: Action to perform after `duration`
    public func asyncAfter(_ duration: TimeInterval, complete: @escaping () -> Void) {
        let view = UIView(frame: .zero)
        view.alpha = 0
        addSubview(view)
        sendSubviewToBack(view)

        UIView.animate(
            withDuration: duration,
            animations: { view.alpha = 0.01 }, // an alpha of 0 doesn't work
            completion: { _ in
                view.removeFromSuperview()
                complete()
            }
        )
    }
}

extension UIViewController {
    /// Insert a delay before performing an action
    ///
    /// - Note:
    ///     This code creates a delay using an 'empty' animation. The reason is so the delay can be speed up during UI tests.
    ///     If we use a `DispatchQueue.asyncAfter` we would need to add 'pauses' in the UI tests.
    ///     We use a UIView extension so this 'hack' is restricted to  _only_ the view layer.
    ///
    /// - Parameters:
    ///   - duration: Duration to wait
    ///   - complete: Action to perform after `duration`
    public func asyncAfter(_ duration: TimeInterval, complete: @escaping () -> Void) {
        view.asyncAfter(duration, complete: complete)
    }
}

//
//  UIViewController+Modal.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import UIKit

extension UIViewController {
    /// Presents a view controller modally.
    ///
    /// - Note:
    ///  Using this method also ensures that the `next` responder
    ///  for the presented view controller is the _presenting_ view controller.
    ///  Which differs from the standard `present(_:animated:completion)` function
    ///  whose default is to use the root view controller as s`next`.
    ///
    /// - Parameters:
    ///   - viewControllerToPresent: The view controller to display over the current view controller’s content.
    ///   - flag: Pass `true` to animate the presentation; otherwise, pass `false`.
    ///   - completion: The block to execute after the presentation finishes.
    ///   This block has no return value and takes no parameters. You may specify
    ///   `nil` for this parameter.
    func presentModal(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        let wrapper = ResponderController(containing: viewControllerToPresent, nextResponder: self)
        present(wrapper, animated: flag, completion: completion)
    }

    /// If the current `presentedViewController` was presented via
    /// `presentModal(_:animated:completion:)`, then dismiss it.
    ///
    /// If the view controller was not presented via that method, this has no
    /// effect.
    ///
    /// - Parameters:
    ///   - animated: Pass `true` to animate the dismissal; otherwise, pass `false`.
    ///   - completion: The block to execute after the dismissal finishes.
    ///   This block has no return value and takes no parameters. You may specify
    ///   `nil` for this parameter.
    func dismissModal(animated: Bool, completion: (() -> Void)? = nil) {
        guard presentedViewController is ResponderController else { return }
        presentedViewController?.dismiss(animated: animated, completion: completion)
    }
}

private class ResponderController: UIViewController {
    private let nextOverride: UIResponder
    private let child: UIViewController

    init(containing: UIViewController, nextResponder: UIResponder) {
        self.nextOverride = nextResponder
        self.child = containing
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(child)
        view.addSubview(child.view)

        child.view.frame = view.bounds
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        child.didMove(toParent: self)
    }

    override var next: UIResponder? {
        return nextOverride
    }

    override var isModalInPresentation: Bool {
        get { child.isModalInPresentation }
        set { child.isModalInPresentation = newValue }
    }
}

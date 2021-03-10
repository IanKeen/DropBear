//
//  RootWindow.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-04.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import UIKit

class RootWindow: UIWindow {
    // MARK: - Private Properties
    private var bag = Set<AnyCancellable>()
    private let viewModel = RootViewModel(session: Dependencies.session)

    // MARK: - Lifecycle
    init() {
        super.init(frame: UIScreen.main.bounds)
        configure()
    }
    override init(windowScene: UIWindowScene) {
        super.init(windowScene: windowScene)
        configure()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    // MARK: - Private
    private func configure() {
        makeKeyAndVisible()

        viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [unowned self] state in
                switch state {
                case .loading:
                    let viewModel = LoadingViewModel(session: Dependencies.session)
                    self.rootViewController = LoadingViewController(viewModel: viewModel)

                case .logIn:
                    let viewModel = LoginViewModel(session: Dependencies.session)
                    self.rootViewController = LoginViewController(viewModel: viewModel)

                case .home:
                    self.rootViewController = HomeViewController()
                }

                self.makeKeyAndVisible()
            })
            .store(in: &bag)
    }

    // MARK: - Responder
    override func showError(_ error: Error) {
        let message = "Something went wrong\n\n\(error.localizedDescription)"
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))

        topMostViewController!.present(alert, animated: true, completion: nil)
    }
}

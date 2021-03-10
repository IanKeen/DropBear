//
//  UIKit+Combine.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import UIKit

class TargetAction: NSObject {
    private let _execute: () -> Void

    init(_ execute: @escaping () -> Void) {
        self._execute = execute
    }

    @objc func execute() {
        _execute()
    }
}

extension UIButton {
    typealias Confirm = (Bool) -> Void

    func bind(to input: Input<Void>.SendProxy, confirm: @escaping (@escaping Confirm) -> Void = { $0(true) }) -> AnyCancellable {
        let box = TargetAction {
            confirm({ success in
                guard success else { return }
                input()
            })
        }

        addTarget(box, action: #selector(TargetAction.execute), for: .touchUpInside)

        return .init { [weak self] in
            self?.removeTarget(box, action: #selector(TargetAction.execute), for: .touchUpInside)
        }

    }
}

extension UITextField {
    func bind(to input: Input<String>.SendProxy) -> AnyCancellable {
        return NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .sink(receiveValue: weak(self) { this, _ in
                input.callAsFunction(this.text ?? "")
            })
    }
}

extension UIRefreshControl {
    func bind(to input: Input<Void>.SendProxy) -> AnyCancellable {
        let box = TargetAction(input.callAsFunction)

        addTarget(box, action: #selector(TargetAction.execute), for: .primaryActionTriggered)

        return .init { [weak self] in
            self?.removeTarget(box, action: #selector(TargetAction.execute), for: .primaryActionTriggered)
        }
    }
}

extension UISwitch {
    func bind(to input: Input<Bool>.SendProxy) -> AnyCancellable {
        let box = TargetAction { [weak self] in
            guard let self = self else { return }
            input(self.isOn)
        }

        addTarget(box, action: #selector(TargetAction.execute), for: .primaryActionTriggered)

        return .init { [weak self] in
            self?.removeTarget(box, action: #selector(TargetAction.execute), for: .primaryActionTriggered)
        }
    }
}

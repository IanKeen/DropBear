//
//  UIResponder.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import UIKit

extension UIResponder {
    @objc func showError(_ error: Error) {
        assertNext()?.showError(error)
    }

    @objc func dismissNewItem() {
        assertNext()?.dismissNewItem()
    }

    @objc func showItemDetails(_ box: ResponderBox) {
        assertNext()?.showItemDetails(box)
    }
    func showItemDetails(_ item: ListItemDetailsViewModel) {
        showItemDetails(.init(item))
    }
}

extension UIResponder {
    func assertNext(_ function: String = #function) -> UIResponder? {
        if let next = next {
            return next
        }

        print("⚠️ Unhandled event: \(function), Last responder: \(self)")
        let stack = Thread.callStackSymbols.prefix(while: { $0.contains(Bundle.main.appName) })
        if let sender = stack.last {
            print("\tSender:", sender)
        }
        return nil
    }
}

private extension Bundle {
    var appName: String { return (object(forInfoDictionaryKey: "CFBundleExecutable") as? String) ?? "" }
}

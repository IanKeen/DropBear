//
//  Alerts.swift
//  DropBearAppUITests
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import DomainKit
import DropBear
import TestKit

extension Alert {
    static var error: Alert<OkButton> {
        return .init(assertion: .contains("something went wrong"))
    }
}

enum YesNo: Int, AlertButtons {
    case no, yes
}

extension Alert {
    static var logOutConfirmation: Alert<YesNo> {
        return .init(assertion: .contains("are you sure?"))
    }
}

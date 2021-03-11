//
//  Alert+Presets.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

// MARK: - Generic Alert
public enum OkButton: Int, AlertButtons {
    case ok
}

extension Alert {
    public static var any: Alert<OkButton> {
        return .init(assertion: .always)
    }
}

// MARK: - Contacts Permission
public enum ContactAlertButton: Int, AlertButtons {
    case dontAllow
    case allow
}

extension Alert {
    public static var contactsPermission: Alert<ContactAlertButton> {
        return .init(
            source: { _ in Springboard.application },
            assertion: .contains("contacts")
        )
    }
}

// MARK: - Location Permission
public enum LocationAlertButton: Int, AlertButtons {
    case whileUsingApp
    case alwaysAllow
    case dontAllow
}

extension Alert {
    public static var locationPermission: Alert<ContactAlertButton> {
        return .init(
            source: { _ in Springboard.application },
            assertion: .contains("location")
        )
    }
}

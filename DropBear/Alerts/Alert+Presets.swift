public enum ContactAlertButton: String, AlertButton {
    case ok = "OK"
    case dontAllow = "Don’t Allow"
}

extension Alert {
    public static var contactsPermission: Alert<ContactAlertButton> {
        return .init(text: "would like to access your contacts")
    }
}

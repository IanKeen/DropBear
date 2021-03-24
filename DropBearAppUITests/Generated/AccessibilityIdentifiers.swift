// swiftlint:disable all
// Generated using DropBearGen

enum AccessibilityIdentifiers {
	struct HomeViewController: RawRepresentable {
		let rawValue: String
		static let list = HomeViewController(rawValue: "list")
		static let settings = HomeViewController(rawValue: "settings")
		static let tabBar = HomeViewController(rawValue: "tabBar")
	}
	struct ListItemCell: RawRepresentable {
		let rawValue: String
		static let completed = ListItemCell(rawValue: "completed")
		static let createdOn = ListItemCell(rawValue: "createdOn")
		static let title = ListItemCell(rawValue: "title")
	}
	struct ListItemDetailsViewController: RawRepresentable {
		let rawValue: String
		static let date = ListItemDetailsViewController(rawValue: "date")
	}
	struct ListNavigationController: RawRepresentable {
		let rawValue: String
		static let add = ListNavigationController(rawValue: "add")
	}
	struct ListViewController: RawRepresentable {
		let rawValue: String
		static let tableView = ListViewController(rawValue: "tableView")
	}
	struct LoginViewController: RawRepresentable {
		let rawValue: String
		static let login = LoginViewController(rawValue: "login")
		static let password = LoginViewController(rawValue: "password")
		static let username = LoginViewController(rawValue: "username")
	}
	struct SettingsViewController: RawRepresentable {
		let rawValue: String
		static let logOut = SettingsViewController(rawValue: "logOut")
	}
}
import UIKit
import Contacts

class ScrollableStackViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private var label: UILabel!
    @IBOutlet private var segment: UISegmentedControl!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        segment.accessibilityIdentifier = "segment"
    }

    //  MARK: - Actions
    @IBAction private func buttonTouchUpInside(sender: UIButton) {
        CNContactStore().requestAccess(for: .contacts) { [weak self] success, _ in
            DispatchQueue.main.async {
                switch success {
                case true: self?.label.text = "Allowed"
                case false: self?.label.text = "Denied"
                }
            }
        }
    }
    @IBAction private func showTabBarController() {
        let vc = UIStoryboard(name: "TabBarController", bundle: nil).instantiateInitialViewController()!
        navigationController!.pushViewController(vc, animated: true)
    }
}

import UIKit

class Tab2ViewController: UIViewController {
    @IBAction func buttonTap() {
        let viewController = TableViewController()
        navigationController!.pushViewController(viewController, animated: true)
    }
}

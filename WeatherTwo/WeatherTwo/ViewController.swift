import UIKit

class ViewController: UIViewController {

    // MARK: - Subviews
    
    let tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()



    // MARK: - Life Cycle

        setupView()
        addSubviews()
    }



    // MARK: - Private

    private func setupView() {
        self.view.backgroundColor = UIColor.systemBlue
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
}

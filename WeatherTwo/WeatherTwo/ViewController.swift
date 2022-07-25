import UIKit

class ViewController: UIViewController {



    // MARK: - Subviews

    let tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()



    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()
        
//        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=59.939099?lon=30.315877"
    }



    // MARK: - Private

    private func setupView() {
        view.backgroundColor = UIColor.systemBlue
    }

    private func addSubviews() {
        view.addSubview(tableView)
    }
}

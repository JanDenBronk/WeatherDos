import UIKit



//protocol WeatDisplayLogic: AnyObject {
//    func displayData()
//}



class WeatViewController: UIViewController {



    let emptyCity = Weat()
    var citiesArray = [Weat]()
    let nameCitiesArray = ["Якутск", "Москва", "Санкт-Петербург"]

    let networkWeatherManager = NetworkWeather()
    
    var refreshControl = UIRefreshControl()



    // MARK: - Subviews

    private let tableView: UITableView = {
            let tableView = UITableView()
            tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
            return tableView
        }()



    // MARK: - Relations
    
//    private var interactor: WeatBusinessLogic?
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        setupLogic()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupLogic()
//    }
//
//    private func setupLogic() {
//
//        let viewController = self
//        let presenter = WeatPresenter()
//        let interactor = WeatInteractor()
//
//        interactor.presenter = presenter
//        presenter.viewController = viewController
//        viewController.interactor = interactor
//    }
    
    

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()


        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }

        addCities()
        configureTableVIew()
        addSubviews()
        setupConstraints()



        func addCities() {
            getCityWeather(citiesArray: self.nameCitiesArray) { (index, weather) in
                self.citiesArray[index] = weather
                self.citiesArray[index].name = self.nameCitiesArray[index]

                print(self.citiesArray)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }

        func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableView.frame = view.bounds
        }
    }



    // MARK: - Private

    private func addSubviews() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .systemYellow
    }

    private func configureTableVIew() {
        tableView.dataSource = self
        tableView.delegate = self
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh (send: UIRefreshControl) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }

    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
        ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let cityWeather = citiesArray[indexPath.row]
            let dstVC = segue.destination as! WeatVControllerTwo
            dstVC.weatherTwo = cityWeather
            print(cityWeather)
        }
    }
}



//    extension WeatViewController: WeatDisplayLogic {
//    func displayData() {
//
//    }
//}



extension WeatViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
    }

        var weather = Weat()
        weather = citiesArray[indexPath.row]
        cell.configure(weather: weather)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let rootVC = WeatVControllerTwo()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true)
    }
    

}

import UIKit



//protocol WeatDisplayLogic: AnyObject {
//    func displayData()
//}



class WeatViewController: UIViewController {



    let emptyCity = Weat()
    var citiesArray = [Weat]()
    let nameCitiesArray = ["Якутск", "Москва", "Санкт-Петербург"]

    let networkWeatherManager = NetworkWeather()



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
//      setupView()
        tuneTableView()
        
        
        
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
        
    
        
        
    // MARK: - Label
        
//        let nameCityLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//        nameCityLabel.center = CGPoint(x: 160, y: 285)
//        nameCityLabel.textAlignment = .center
//        nameCityLabel.text = ""
//        self.view.addSubview(nameCityLabel)
    }



    // MARK: - Private

//    private func setupView() {
//        view.backgroundColor = UIColor.systemBlue
//        navigationItem.title = "Прогноз погоды"
//        view.addSubview(self.tableView)
//        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
//    }

    private func addSubviews() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    private func configureTableVIew() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func tuneTableView() {
        
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
}

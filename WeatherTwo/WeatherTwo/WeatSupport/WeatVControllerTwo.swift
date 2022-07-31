import UIKit



class WeatVControllerTwo: UIViewController {


    
    var nazvanie: UILabel!
    var conditionInfo: UILabel!
    var tempInfo: UILabel!
    var veterSpeed: UILabel!

    var weatherTwo: Weat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        

    }
    
    func refreshLabels() {
//        let nazvanie = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//        nazvanie.center = CGPoint(x: 160, y: 285)
//        nazvanie.textAlignment = .center
//        nazvanie.text = "\(weatherTwo?.name))"
//        self.view.addSubview(nazvanie)
        conditionInfo.text = weatherTwo?.condition
        tempInfo.text = "\((weatherTwo?.temperature)!)"
        veterSpeed.text = "\((weatherTwo?.windSpeed)!)"
    }
}

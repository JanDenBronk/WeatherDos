import Foundation

struct NetworkWeather {
    func fetchWeather(latitude: Double, longitude: Double, completionHandler: @escaping (Weat) -> Void) {
        
        let urlPlace: String = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: urlPlace) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
//            print(String(data: data, encoding: .utf8)!)
            if let weather = self.parseJSON(withData: data) {
                completionHandler(weather)
            }
        }
        
        task.resume()
        
    }
    
    func parseJSON(withData data: Data) -> Weat? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatData.self, from: data)
            guard let weather = Weat(weatherData: weatherData) else {
                return nil
            }
                return weather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}

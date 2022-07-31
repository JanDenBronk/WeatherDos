import Foundation



struct WeatData: Decodable {
    
    let info: Info
    let fact: Fact
}



struct Info: Decodable {
    
    let url: String
}



struct Fact: Decodable {
    
    let temp: Double
    let condition: String
    let windSpeed: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case condition
        case windSpeed = "wind_speed"
    }
}

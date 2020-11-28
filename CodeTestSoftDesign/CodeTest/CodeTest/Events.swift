
import Foundation

// MARK: - Event
class Event: Codable {
    let people: [Person]?
    let date: Int?
    let description: String?
    let image: String?
    let longitude, latitude: Double?
    let price: Double?
    let title, id: String?

    enum CodingKeys: String, CodingKey {
        case people, date
        case description
        case image, longitude, latitude, price, title, id
    }

    init(people: [Person]?, date: Int?, description: String?, image: String?, longitude: Double?, latitude: Double?, price: Double?, title: String?, id: String?) {
        self.people = people
        self.date = date
        self.description = description
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
        self.price = price
        self.title = title
        self.id = id
    }
    
    var formattedDate: String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "E, d MMM yyyy HH:mm:ss"
        
        return dateFormatterPrint.string(from: Date(milliseconds: date!))
    }
    
    var formattedPrice: String {
            
        if let value = price {
           return "\(value)"
        } else {
            return "" 
        }
    }
}

// MARK: - Person
class Person: Codable {

    init() {
    }
}

typealias Events = [Event]

extension Date {
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds))
    }
}


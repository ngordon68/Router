//
//  APIYelp.swift
//  Freemind
//
//  Created by Nick Gordon on 2/6/23.
//




import Foundation
import Combine


//Bearer
//find a way to protect this key
let apiKey = "iTvzHsH40PlOzpMVv5IRKhWLaAyVYvZ3BAIxg8sR9GbgkpqvCUNEgbxouW6irhZlkTHAzRJOw1W1zMBNPEgAdE3z3dLrAzWyo-3U8sdJYF1oLg-7BMvXgTSEZCHhY3Yx"

struct YelpApiService {
    //user inputs search terms and category so far clllocation for location eventually
    var search: (String, String) -> AnyPublisher<[TestWorkSpace], Never>
}

extension YelpApiService {
    static let live = YelpApiService { term, city in
        // url compenent for yelp endpoint
        var urlComponents = URLComponents(string: "https://api.yelp.com")!
        urlComponents.path = "/v3/businesses/search"
        urlComponents.queryItems = [
            .init(name: "term", value: term),
            .init(name: "city", value: city),
            //.init(name: "categories", value: cat ?? "restaurants"),
        ]
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        //URL request and return [businesses]
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .map(\.testWorkSpace)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
}


//MARK -  Search Result
struct SearchResult: Codable {
    
    let testWorkSpace: [TestWorkSpace]
}

struct TestWorkSpace: Codable, Identifiable {
    let id, alias, name: String?
    let imageURL: String?
    let isClosed: Bool?
    let url: String?
    let reviewCount: Int?
    let categories: [Category]?
    let rating: Double?
    let coordinates: Coordinates?
    let transactions: [String]?
    let price: String?
    let location: Location?
    let phone, displayPhone: String?
    let distance: Double?

    enum CodingKeys: String, CodingKey {
        case id, alias, name
        case imageURL = "image_url"
        case isClosed = "is_closed"
        case url
        case reviewCount = "review_count"
        case categories, rating, coordinates, transactions, price, location, phone
        case displayPhone = "display_phone"
        case distance
    }
}

// MARK: - Category
struct Category: Codable {
    let alias, title: String?
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: Double?
}

// MARK: - Location
struct Location: Codable {
    let address1, address2, address3, city: String?
    let zipCode, country, state: String?
    let displayAddress: [String]?

    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city
        case zipCode = "zip_code"
        case country, state
        case displayAddress = "display_address"
    }
}



class TestApi: ObservableObject {
    
    @Published var testworkspaces = [TestWorkSpace]()
    
    func search() {
        let live = YelpApiService.live
        
        live.search("food", "Detroit")
            .assign(to: &$testworkspaces)
        
        print(testworkspaces.count)
        
    }
}

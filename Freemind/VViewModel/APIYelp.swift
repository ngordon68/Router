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


//MARK -  Search Result
struct SearchResult: Codable {
    
    let testWorkSpace: [TestWorkSpace]
}

class TestApi: ObservableObject {
    
     
    @Published var testworkspaces = [TestWorkSpace]()
    
    var cancellables = Set<AnyCancellable>()
   
    
    init() {
    //vm.search()
     getPosts()
    }
    
 
    func getPosts() {
        
     //   var search: (String, String) -> AnyPublisher<[TestWorkSpace], Never>
    
    // let baseurl = "https://api.yelp.com/v3/businesses/search?location=detroit&sort_by=best_match&limit=20"
       
       //let baseurl = "https://api.yelp.com/v3/businesses/search?location=Detroit&term=good%20for%20working&sort_by=best_match&limit=30"
        
       // let baseurl = "https://api.yelp.com/v3/businesses/search?location=detroit&term=farmer%27s%20market&categories=work%20table&sort_by=best_match&limit=25"
        
      let baseurl =  "https://api.yelp.com/v3/businesses/search?location=Detroit&term=Free%20wifi&sort_by=best_match&limit=20"

        let url = URL(string: baseurl )!
        var request = URLRequest(url: url)
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        
        //combine workflow
        //create the publisher
        //put publisher on the background thread(subscribe publisher on background thread)
        //receive on main thead
        //tryMap(check that the data is good)
        //decode (decode data into Models)
        //sink (put the item into the app)
        //store (cancel subscription if needed)
        
        
        URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                print(data.description)
                //this works!
                
                return data
             
            }
            .decode(type: TestWorkSpaceArray.self, decoder: JSONDecoder())
            .sink { (completion) in
                print("Complete test: \(completion)")
               
              
    
            } receiveValue: { [weak self] (returnedWorkSpaces) in
                guard let self = self, let businesses = returnedWorkSpaces.businesses else {
                    // Error handling
                    return
                }
                self.testworkspaces = businesses
                print(businesses.count)
         
            }
            .store(in: &cancellables)
    }
    
    
}










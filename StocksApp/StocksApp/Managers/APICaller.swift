//
//  APICaller.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-21.
//

import Foundation

/*fileprivate enum Endpoint : String
{
    case search
}*/

/*fileprivate enum APICallerError : Error
{
    case noDataReturned
    case invalidURL
}*/


// MARK: - APICaller
final class APICaller
{
    //MARK: - properties
    static let shared = APICaller()
    private var taskArray : [URLSessionDataTask] = [URLSessionDataTask]()
    private let sharedTaskOptimizer = TaskOptimizer.shared
    
    //MARK: - System Methods and Initializer
    private init() {}
    
    
    // MARK: Public Functions
    public func search(query : String, completion : @escaping (Result<SearchResponse,Error>) -> Void) -> Void
    {
        guard let safeQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        let urlToUse = createURL(for: .search, queryParams: ["q" : safeQuery])
        initiateRequest(url: urlToUse, expecting: SearchResponse.self, completion: completion)
    }
    
    
    // get stock info
    
    
    
    // search for stock
    
    
    // MARK: Private functions
    private func createURL(for endpoint : Endpoint, queryParams : [String : String] = [:]) -> URL?
    {
        // we will be filling this out with our baseURL and different options as well
        var urlString = Constants.baseURL + endpoint.rawValue
        
        // Add any parameters
        var queryItems = [URLQueryItem]()
        for(name,value) in queryParams
        {
            queryItems.append(.init(name: name, value: value))
            // what we are doing here is adding all of the query params into our queryItems array
        }
        
        // Add token
        queryItems.append(.init(name: "token", value: Constants.apikey))
        
        // convert query items to suffix string
        let queryString = queryItems.map{"\($0.name)=\($0.value ?? "")"}.joined(separator: "&")
        urlString += "?" + queryString
        print("This is the url that the search is being conducted with :\(urlString)")
        return URL(string: urlString)
    }
    
    private func initiateRequest<T:Codable>(url : URL?, expecting: T.Type, completion : @escaping (Result<T,Error>) -> Void)
    {
        // so we are going to be making a variety of api calls. So the reason why we are using generics here is so we do not have to make repeated function calls as we can pass in our generic parameter to accomodate for the various different types.
        guard let safeURL = url else {
            completion(.failure(APICallerError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: safeURL) { data, _, error in
            guard let safeData = data, error == nil else {
                if let safeError = error
                {
                    completion(.failure(safeError))
                    return
                }
                else
                {
                    completion(.failure(APICallerError.noDataReturned))
                    return
                }
            }
            // success so now we need to do decode our data
            do
            {
                let result = try JSONDecoder().decode(expecting, from: safeData)
                completion(.success(result))
            }
            catch
            {
                // here is a failure meaning we are not able to decode the data
                completion(.failure(error))
            }
        }
        sharedTaskOptimizer.appendToQueue(taskToAppend: task)
    }
    
    /// Gets data for both API Endpoints
    internal func getNews(for type: NewsType, completion: @escaping (Result<[NewsStories],Error>) -> Void)
    {
        switch type
        {
        case .topStories:
            let queryParams : [String : String] = ["category" : "general"]
            let urlToUse = createURL(for: .news, queryParams: queryParams)
            guard let safeURL = urlToUse else {
                completion(.failure(APICallerError.invalidURL))
                return
            }
            // success
            initiateRequest(url: safeURL, expecting: [NewsStories].self) { result in
                switch result
                {
                case .success(let result):
                    completion(.success(result))
                
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        
        case .companyNews(symbol: let symbol):
            let today = Date()
            let oneWeekback = today.addingTimeInterval(-(3600 * 24 * 7))
           
            let oneWeekBackAsString = DateFormatter.newsDateFormatter.string(from: oneWeekback)
            let todayDateAsString = DateFormatter.newsDateFormatter.string(from: today)
            
            let queryParams : [String : String] = [
                "symbol" : symbol.lowercased(),
                "from" : oneWeekBackAsString,
                "to" : todayDateAsString
            ]
            let urlToUse = createURL(for: .companyNews, queryParams: queryParams)
            guard let safeURL = urlToUse else {
                completion(.failure(APICallerError.invalidURL))
                return
            }
            initiateRequest(url: safeURL, expecting: [NewsStories].self) { result in
                switch(result)
                {
                
                case .success(let result):
                    completion(.success(result))
                
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        
    }
    
    
    
}




//
//  NewsSearchTestClient.swift
//  StocksAppTests
//
//  Created by Vinojen Gengatharan on 2021-11-11.
//

import Foundation
@testable import StocksApp

class NewsSearchTestClient
{
    // properties
    var baseURL : URL
    var session : DataTaskMaker
    var responseQueue : DispatchQueue?
    
    // initializers
    init(baseURLVal : URL, sessionVal : DataTaskMaker, responseQueueVal : DispatchQueue?)
    {
        baseURL = baseURLVal
        session = sessionVal
        responseQueue = responseQueueVal
    }
    
    // functions
    internal func getTopNews(completion : @escaping(Data?,Error?) -> Void)
    {
        let url = URL(string: "NewsStories.json", relativeTo: baseURL)
        guard let safeURL = url else {return}
        let task = session.dataTask(with: safeURL) { data, response, error in
            guard let safeData = data, error == nil else
            {
                completion(nil,error)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
            completion(safeData,nil)
        }
        task.resume()
    }
    
    
}

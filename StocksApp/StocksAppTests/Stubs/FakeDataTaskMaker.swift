//
//  FakeDataTaskMaker.swift
//  StocksAppTests
//
//  Created by Vinojen Gengatharan on 2021-11-11.
//

import Foundation
@testable import StocksApp
import XCTest

struct FakeDataTaskMaker : DataTaskMaker
{
    static let dummyURL = URL(string: "DummyURL")!
    init() throws
    {
        let testBundle = Bundle(for: StockSearchTestCase.self)
        let url = try XCTUnwrap(testBundle.url(forResource: "StockSearch", withExtension: "json"))
        data = try.init(contentsOf: url)
    }
    let data : Data
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
    {
        let response = HTTPURLResponse(url: FakeDataTaskMaker.dummyURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        completionHandler(data, response, nil)
        return URLSession(configuration: .default).dataTask(with: FakeDataTaskMaker.dummyURL)
    }
}



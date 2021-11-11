//
//  StocksAppTests.swift
//  StocksAppTests
//
//  Created by Vinojen Gengatharan on 2021-11-04.
//

import XCTest
@testable import StocksApp


final class StockSearchTestCase: XCTestCase {
    // properties
    let urlAsString = "https://finnhub.io/api/v1/search?q=Apple&token=c59jcq2ad3i93kd1rbn0"
    var expectationToFulfil : XCTestExpectation!
    
    func test_StockSearchFunctionality()
    {
        guard let safeURL = URL(string: urlAsString) else {return}
        expectationToFulfil = expectation(description: "Stock search functionality works.")
        URLSession.shared.dataTask(with: safeURL) {[weak self] data, response, error in
            guard let strongSelf = self else {return}
            defer {
                strongSelf.expectationToFulfil.fulfill()
            }
            do
            {
                let response = try XCTUnwrap(response as? HTTPURLResponse)
                XCTAssertEqual(response.statusCode, 200)
                let data = try XCTUnwrap(data)
                XCTAssertNoThrow(try JSONDecoder().decode(SearchResponse.self, from: data))
            }
            catch
            {
                XCTFail("Either the URLResponse was not valid or there was a decoding error")
            }
        }
        .resume()
        waitForExpectations(timeout: 60, handler: nil)
    }
   

}

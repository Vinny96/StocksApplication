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
    
    func test_StockSearch_DecodingFunctionality() throws
    {
        let tester = StockSearchTestClient(baseURLVal: FakeDataTaskMaker.dummyURL, sessionVal: try FakeDataTaskMaker(), responseQueueVal: nil)
        tester.getStockForGivenSmybol { data, error in
            
            XCTAssertNil(error)
            do
            {
                let safeData = try XCTUnwrap(data)
                XCTAssertNoThrow(try JSONDecoder().decode(SearchResponse.self, from: safeData), "The JSON can be decoded successfully")
            }
            catch
            {
                XCTFail("The data could not be unwrapped or the data could not be decoded properly.")
            }
        }
    }

    
}



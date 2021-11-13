//
//  NewsSearchTestCase.swift
//  StocksAppTests
//
//  Created by Vinojen Gengatharan on 2021-11-11.
//

import XCTest
@testable import StocksApp

class NewsSearchTestCase: XCTestCase
{
    func test_NewsSearch_DecodeFunctionality() throws
    {
        let tester =  NewsSearchTestClient(baseURLVal: FakeDataTaskMaker.dummyURL, sessionVal: try FakeDataTaskMaker(fakeType: .NewsStories), responseQueueVal: nil)
        tester.getTopNews { data, error in
            do
            {
                let safeData = try XCTUnwrap(data)
                XCTAssertNoThrow(try JSONDecoder().decode([NewsStories].self, from: safeData), "The fake data was not able to successfully deserialize to our NewsStories.N")
            }
            catch
            {
                XCTFail("There was a decoding error")
            }
        }
    }
    
}

//
//  GeneralNews.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-10-24.
//

import Foundation

struct TopNews : Codable
{
    /**
     "category": "top news",
     "datetime": 1635106560,
     "headline": "Earnings Watch: Holiday earnings forecasts have been lumps of coal so far, and here come the biggest ones",
     "id": 6972528,
     "image": "https://images.mktw.net/im-418199/social",
     "related": "",
     "source": "MarketWatch",
     "summary": "Holiday earnings forecasts are disappointing investors so far, and the biggest boxes under Wall Street's tree are coming this week.",
     "url": "https://www.marketwatch.com/story/holiday-earnings-forecasts-have-been-lumps-of-coal-so-far-and-here-come-the-biggest-ones-11635106579"
     */
    var category : String
    var datetime : TimeInterval
    var headline : String
    var id : Int
    var image : String
    var related : String
    var source : String
    var summary : String
    var url : String
}

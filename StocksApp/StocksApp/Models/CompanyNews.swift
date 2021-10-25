//
//  CompanyNews.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-10-24.
//

import Foundation

struct CompanyNews : Codable
{
    /**
     "category": "company",
     "datetime": 1631179227,
     "headline": "Tencent Leads $60 Billion Selloff As Gaming Crackdown Fears Grow",
     "id": 70401756,
     "image": "https://s.yimg.com/ny/api/res/1.2/GqxZIjDgjUk3HYz.1cj1Mw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04MDA-/https://s.yimg.com/uu/api/res/1.2/CCVJvo02fUqKyNGXcMx8bQ--~B/aD0yNjY3O3c9NDAwMDthcHBpZD15dGFjaHlvbg--/https://media.zenfs.com/en/bloomberg_technology_68/e7c875c531c474dbb2ae27414da1e419",
     "related": "AAPL",
     "source": "Yahoo",
     "summary": "(Bloomberg) -- Tencent Holdings Ltd. and Netease Inc. shed more than $60 billion of value as investor fears grow that Chinese regulators are preparing to tighten their grip dramatically on the world’s largest gaming industry.Chinese regulators summoned industry executives to a Wednesday meeting to instruct them to break their “solitary focus” on profit and prevent minors from becoming addicted to games, according to the official Xinhua News Agency. Regulators also said there will be a temporary",
     "url": "https://finnhub.io/api/news?id=84c5b4de755ccc3e00ee9c4b208f0861aa73883903a77d5ad317762fbd20a9ee"
     */
    var category : String
    var datetime : Int
    var headline : String
    var id : Int
    var image : String
    var related : String
    var source : String
    var summary : String
    var url : String
    
    
    
}

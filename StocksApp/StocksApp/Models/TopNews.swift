//
//  GeneralNews.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-10-24.
//

import Foundation

struct TopNews : Codable
{T
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

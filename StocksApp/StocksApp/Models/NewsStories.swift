//
//  GeneralNews.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-10-24.
//

import Foundation

struct NewsStories : Codable
{
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

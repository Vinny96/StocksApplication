//
//  SearchResponse.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-28.
//

import Foundation

struct SearchResponse : Codable
{
    let count : Int
    let result : [SearchResponseResult]
}

//
//  QueryResult.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-28.
//

import Foundation

struct SearchResponseResult : Codable
{
    let description : String
    let displaySymbol : String
    let symbol : String
    let type : String
    
    
}

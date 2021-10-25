//
//  NewsType.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-10-05.
//

import Foundation

internal enum NewsType
{
    case topStories
    case companyNews(symbol : String)
    
    var title : String {
        switch self {
        case .topStories:
            return "Top Stories"
        case .companyNews(let symbol):
            return symbol.uppercased()
        }
    }
}

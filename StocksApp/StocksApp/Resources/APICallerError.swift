//
//  APICallerError.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-21.
//

import Foundation

internal enum APICallerError : Error
{
    case noDataReturned
    case invalidURL
}

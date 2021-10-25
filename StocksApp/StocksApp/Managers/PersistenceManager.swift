//
//  PersistenceManager.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-21.
//

import Foundation

final class PersistenceManager
{
    
    //MARK: - Properties
    static let shared = PersistenceManager()
    
    private let userDefaults = UserDefaults.standard
    private var hasOnBoarded : Bool {
        return false
    }
    internal var watchList : [String] {
        return []
    }
    
    
    //MARK: - Initializer and system called functions
    private init()
    {
        
    }
    
    
    
    //MARK: - Functions

    internal func addToWatchList()
    {
        
    }
    
    internal func removeFromWatchList()
    {
        
        
    }
    
}

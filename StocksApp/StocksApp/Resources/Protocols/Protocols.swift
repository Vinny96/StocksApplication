//
//  Protocols.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-23.
//

import Foundation
import UIKit

protocol SearchResultsViewControllerDelegate: AnyObject
{
    func searchResultViewConttrollerDidSelect(searchResult : SearchResponseResult)
}

protocol NewsHeaderViewDelegate: AnyObject
{
    func newsHeaderViewDidTapAddButton(headerView : UITableViewHeaderFooterView)
}


// For Unit Testing
protocol DataTaskMaker
{
    func dataTask(with url : URL, completionHandler : @escaping(Data?, URLResponse?,Error?) -> Void) -> URLSessionDataTask
}

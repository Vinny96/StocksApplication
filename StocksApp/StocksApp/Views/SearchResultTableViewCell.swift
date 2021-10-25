//
//  SearchResultTableViewCell.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-22.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    // MARK: - Properties
    static internal let identifier = "SearchResultTableViewCell"
   
    
    
    //MARK: - System called functions and initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    

    
}

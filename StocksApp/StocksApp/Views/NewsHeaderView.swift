//
//  NewsHeaderView.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-10-06.
//

import UIKit

class NewsHeaderView: UITableViewHeaderFooterView
{
    //MARK: - Properties
    static let identifier = "NewsHeaderView"
    static let preferredHeight: CGFloat = 70
    
    
    private let label : UILabel = {
        let labelToReturn = UILabel()
        labelToReturn.font = .boldSystemFont(ofSize: 32)
        return labelToReturn
    }()
    
    private let button : UIButton = {
        let buttonToReturn = UIButton()
        buttonToReturn.setTitle("+ Watchlist", for: .normal)
        buttonToReturn.backgroundColor = .systemBlue
        buttonToReturn.setTitleColor(.white, for: .normal)
        buttonToReturn.layer.cornerRadius = 8
        buttonToReturn.layer.masksToBounds = true
        return buttonToReturn
    }()
    
    weak internal var delegate : NewsHeaderViewDelegate?
    
    //MARK: - System Called Functions
    override init(reuseIdentifier: String?)
    {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(views: label,button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        initializeUIFrame()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    
    //MARK: - @OBJC Functions
    @objc private func didTapButton()
    {
        // call delegate method
        delegate?.newsHeaderViewDidTapAddButton(headerView: self)
        
    }
    
    //MARK: - UI Functions
    private func initializeUIFrame()
    {
        label.frame = CGRect(x: 14, y: 0, width: contentView.width - 28, height: contentView.height)
        button.sizeToFit()
        button.frame = CGRect(x: contentView.width - button.width - 16, y: (contentView.height - button.height) / 2, width: button.width + 8, height: button.height)
    }
    
    
    //MARK: - Functions
    internal func configure(with viewModel : NewsHeaderViewModel)
    {
        label.text = viewModel.title
        button.isHidden = !viewModel.shouldShowAddButton
    }
    
    
    
}

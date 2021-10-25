//
//  TopStoriesViewController.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-21.
//

import UIKit

class NewsViewController: UIViewController {

    // MARK: - Properties
    internal var tableView : UITableView = {
        let table = UITableView()
        // here we need to register the header and cells
        table.register(NewsHeaderView.self, forHeaderFooterViewReuseIdentifier: NewsHeaderView.identifier)
        table.backgroundColor = .clear
        return table
    }()
    
    private var newsType : NewsType
    private var stories : [String] = [String]() // this is going to have a dedicated model for it afterwards
    
    
    //MARK: - System called functions and Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVC()
    }
    
    init(newsType : NewsType) {
        self.newsType = newsType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: - UI Functions
    private func initializeTableView()
    {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    //MARK: - Functions
    private func initializeVC()
    {
        initializeTableView()
        fetchNews()
    }
    
    
    private func fetchNews()
    {
        
        
    }
    
    private func openURL(url : URL)
    {
            
        
    }
    
    
    
    
}

extension NewsViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 140
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsHeaderView.identifier) as? NewsHeaderView else {
            return nil
        }
        header.configure(with: .init(title: newsType.title, shouldShowAddButton: false))
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return NewsHeaderView.preferredHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}




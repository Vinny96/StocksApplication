//
//  SearchResultsViewController.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-21.
//

import UIKit

class SearchResultsViewController: UIViewController {

    //MARK: - Properties
    private let tableView : UITableView = {
        let table = UITableView()
        // register a cell
        table.isHidden = true
        table.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        return table
    }()
    internal weak var delegate : SearchResultsViewControllerDelegate?
    private var searchResponseResults : [SearchResponseResult] = [SearchResponseResult]() // string is just a placeholder for now we will create a model for this.
    
    // MARK: - UI Functions
    private func initializeUI()
    {
        tableView.frame = view.bounds
    }
    
    // MARK: - System called functions and initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVC()
        print("SearchResultsViewController is getting initialized")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initializeUI()
    }

    
    // MARK: - Functions
    private func initializeVC()
    {
        view.backgroundColor = .systemBackground
        setUpTableView()
    }
    
    private func setUpTableView()
    {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    internal func updateTableView(with results : SearchResponse)
    {
        searchResponseResults = results.result
        tableView.isHidden = searchResponseResults.isEmpty
        tableView.reloadData()
    }
}

//MARK: - Extensions
extension SearchResultsViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponseResults.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath)
        // cell.textLabel?.text = "AAPL"
        //cell.detailTextLabel?.text = "Apple Inc"
        let symbolToDisplay = searchResponseResults[indexPath.row].symbol
        let descriptionToDisplay = searchResponseResults[indexPath.row].description
        cell.textLabel?.text = symbolToDisplay
        cell.detailTextLabel?.text = descriptionToDisplay
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let stockSelected = searchResponseResults[indexPath.row]
        delegate?.searchResultViewConttrollerDidSelect(searchResult: stockSelected)
    }
}

// stopped at 7:49

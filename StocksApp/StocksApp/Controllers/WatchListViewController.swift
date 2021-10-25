//
//  ViewController.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-21.
//

import UIKit
import FloatingPanel

class WatchListViewController: UIViewController {

    // MARK: - Properties
    private var searchTimer : Timer?
    private var floatingPanel : FloatingPanelController?
    
    
    // MARK: - System called functions
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVC()
        setUpFloatingPanelController()
    }

    // MARK: - Functions
    private func setUpFloatingPanelController()
    {
        let vc = NewsViewController(newsType: .topStories)
        let floatingPanel = FloatingPanelController(delegate: self)
        floatingPanel.surfaceView.backgroundColor = .secondarySystemBackground
        floatingPanel.set(contentViewController: vc)
        floatingPanel.addPanel(toParent: self)
        floatingPanel.track(scrollView: vc.tableView)
    }
    
    
    private func initializeVC()
    {
        view.backgroundColor = .systemBackground
        setUpTitleView()
        setUpSearchController()
    }
    
    private func setUpTitleView()
    {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: titleView.width - 20, height: titleView.height))
        label.text = "Stocks"
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        titleView.addSubview(label)
        navigationItem.titleView = titleView
    }
    
    private func setUpSearchController()
    {
        let resultsVC = SearchResultsViewController()
        resultsVC.delegate = self
        let searchVC = UISearchController(searchResultsController: resultsVC)
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
    
}

//MARK: - Extensions
extension WatchListViewController : UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        guard let resultsVC = searchController.searchResultsController as? SearchResultsViewController else {return}
        guard let searchQuery = searchController.searchBar.text, !searchQuery.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        // searchQuery is not empty
        
        // call API to search
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: false, block: { _ in
            APICaller.shared.search(query: searchQuery) { result in
                switch result
                {
                case .success(let response):
                    print("success")
                    // we should also run 
                    DispatchQueue.main.async {
                        resultsVC.updateTableView(with: response)
                    }
                case .failure(let error):
                    // this could also  mean that no results were present we should account for that possibility as well.
                    print("There was an error in calling the search functionality for the api or the task was cancelled: \(error)")
                }
            }
        })
        // we also want to optimize so we can reduce the number of searches as we do not want to call the search for every keystroke. We do not want multiple api calls.
        
        // we then want to present the results in the resultsViewController
    }
    
}

extension WatchListViewController : SearchResultsViewControllerDelegate
{
    func searchResultViewConttrollerDidSelect(searchResult: SearchResponseResult)
    {
        // present stock details for given selection
        print("The stock that has been selected is the following: \(searchResult)")
        let stocksDetailVC = StocksDetailsViewController()
        let navVC = UINavigationController(rootViewController: stocksDetailVC)
        stocksDetailVC.title = searchResult.description
        present(navVC, animated: true)
        // so what we want to do here is that we want to bring up the FloatingPanelController and show it to the user.
    }
}

extension WatchListViewController : FloatingPanelControllerDelegate
{
    func floatingPanelDidChangeState(_ fpc: FloatingPanelController)
    {
        navigationItem.titleView?.isHidden = fpc.state == .full
        // so here the titleView of the navigationItem is going to be depending on whether the state ofthe floatingPanel is full.
    }
    
    
    
}

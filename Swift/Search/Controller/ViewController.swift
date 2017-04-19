//
//  ViewController.swift
//  Search
//
//  Created by John Lima on 19/04/17.
//  Copyright © 2017 John Lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var viewSearch: UIView!
    
    let model = Model()
    let cellName = "cell"
    var searchEnable = false
    var searchController: UISearchController?
    var tableData: Array<Model>?
    var searchData: Array<Model>?
    var selectedIndexPath: IndexPath?
    var refreshControll: UIRefreshControl?
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSearch()
        setupRefresh()
        getData()
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let searchBar = searchController?.searchBar, searchEnable else { return }
        
        searchBarCancelButtonClicked(searchBar)
        clearSearch()
    }
    
    // MARK: - Actions
    fileprivate func createSearch() {
    
        searchController = UISearchController(searchResultsController: nil)
        searchController?.loadViewIfNeeded()
        searchController?.searchResultsUpdater = self
        
        searchController?.searchBar.sizeToFit()
        searchController?.searchBar.barTintColor = .purple
        searchController?.searchBar.tintColor = .white
        
        if let searchBar = searchController?.searchBar {
            viewSearch.addSubview(searchBar)
        }
        
        searchController?.delegate = self
        
        searchController?.dimsBackgroundDuringPresentation = false
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.searchBar.delegate = self
    }
    
    fileprivate func setupRefresh() {
        
        refreshControll = UIRefreshControl()
        refreshControll?.tintColor = .purple
        refreshControll?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        guard let refreshControll = refreshControll else { return }
        
        tableView.addSubview(refreshControll)
    }
    
    fileprivate func getData() {
    
        tableData = model.getData()
        
        refreshControll?.endRefreshing()
        tableView.reloadData()
    }
    
    fileprivate func updateUI() {
        
        let footer = UIView(frame: .zero)
        
        tableView.tableFooterView = footer
        tableView.backgroundColor = .white
        tableView.allowsSelection = (tableData ?? []).count > 0
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    fileprivate func clearSearch() {
        searchData = []
        searchEnable = false
        tableView.reloadData()
    }
    
    dynamic fileprivate func refreshData() {
        getData()
        updateUI()
        clearSearch()
    }
}

extension ViewController: UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        searchData = []
        
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else { return }
        
        for model in (tableData ?? []) {
            if (model.name ?? "").contains(searchText) {
                searchData?.append(model)
            }
        }
        
        searchEnable = searchController.searchBar.showsCancelButton
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text = nil
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        
        tableView.allowsSelection = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBarCancelButtonClicked(searchBar)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        clearSearch()
        tableView.allowsSelection = false
        searchBar.showsCancelButton = true
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = searchEnable ? searchData : tableData
        return (data ?? []).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath)
        
        guard let data = searchEnable ? searchData : tableData else { return cell }
        
        cell.textLabel?.text = data[indexPath.row].name
        cell.textLabel?.textColor = .purple
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        searchController?.isActive = false
        selectedIndexPath = indexPath
    }
}


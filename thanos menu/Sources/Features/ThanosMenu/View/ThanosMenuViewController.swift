//
//  ThanosMenuViewController.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class ThanosMenuViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .systemBackground
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 180
        
        return tableView
    }()
    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search Characters"
        search.automaticallyShowsCancelButton = true
        definesPresentationContext = true
        
        return search
    }()
    lazy var spinnerView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        
        spinner.frame = CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 44)
        spinner.startAnimating()
        
        return spinner
    }()
    let loadingView = LoadingView()
    var dataSourceDelegate: ThanosMenuDataSourceDelegate?
    var viewModel: ThanosMenuViewModelProtocol
    
    init(viewModel: ThanosMenuViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewConfiguration()
        viewModel.fetchFirstCharacters()
        
        dataSourceDelegate?.loadMore = {
            self.viewModel.loadMore(with: nil)
        }
    }
    
    private func registerCells() {
        tableView.register(ThanosMenuTableViewCell.self, forCellReuseIdentifier: ThanosMenuTableViewCell.reuseIdentifier)
    }
}

extension ThanosMenuViewController: ViewCoding {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureViews() {
        title = "Thanos Menu"
        view.backgroundColor = .systemBackground
        
        // Configures searchController
        navigationItem.searchController = searchController
        
        registerCells()
        
        dataSourceDelegate = ThanosMenuDataSourceDelegate(viewModel: viewModel)
        tableView.delegate = dataSourceDelegate
        tableView.dataSource = dataSourceDelegate
        searchController.searchResultsUpdater = dataSourceDelegate
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension ThanosMenuViewController: ThanosMenuViewProtocol {
    func startTableLoading() {
        tableView.tableFooterView = spinnerView
    }
    
    func stopTableLoading() {
        tableView.tableFooterView = UIView()
    }
    
    func startLoading() {
        loadingView.showIn(view: view)
    }
    
    func stopLoading() {
        loadingView.remove()
    }
    
    func reloadDataSource() {
        self.tableView.reloadData()
    }
    
    func showError(error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}

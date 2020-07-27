//
//  CharacterDetailsViewController.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .systemBackground
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 180
        
        return tableView
    }()
    let loadingView = LoadingView()
    var dataSourceDelegate: CharacterDetailsDataSourceDelegate?
    var viewModel: CharacterDetailsViewModelProtocol
    
    init(viewModel: CharacterDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewConfiguration()
        
        viewModel.fetchDetails()
    }
    
    private func registerCells() {
        tableView.register(ThanosMenuTableViewCell.self, forCellReuseIdentifier: ThanosMenuTableViewCell.reuseIdentifier)
    }
}

extension CharacterDetailsViewController: ViewCoding {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureViews() {
        title = "Details"
        view.backgroundColor = .systemBackground
        
        registerCells()
        
        dataSourceDelegate = CharacterDetailsDataSourceDelegate(viewModel: viewModel)
        tableView.delegate = dataSourceDelegate
        tableView.dataSource = dataSourceDelegate
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

extension CharacterDetailsViewController: CharacterDetailsViewProtocol {
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

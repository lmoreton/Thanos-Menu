//
//  ThanosMenuDataSourceDelegate.swift
//  thanos menu
//
//  Created by Lucas Moreton on 23/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class ThanosMenuDataSourceDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var searchBarText: String? = nil
    var loadMore: (() -> Void)?
    var viewModel: ThanosMenuViewModelProtocol
    
    init(viewModel: ThanosMenuViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ThanosMenuTableViewCell.reuseIdentifier, for: indexPath) as? ThanosMenuTableViewCell else { fatalError(ThanosMenuTableViewCell.reuseIdentifier) }
        
        let character = self.viewModel.characters[indexPath.row]
        cell.configure(with: character)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        
        if indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex {
            self.viewModel.startTableLoading()
            self.viewModel.loadMore(with: searchBarText)
            
        } else {
            self.viewModel.stopTableLoading()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = viewModel.characters[indexPath.row]
        viewModel.didSelectCharacter(character: character)
    }
}

extension ThanosMenuDataSourceDelegate: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.isActive {
            searchBarText = searchController.searchBar.text
            
            self.viewModel.cleanState()
            self.viewModel.loadMore(with: searchBarText)
        }
    }
}

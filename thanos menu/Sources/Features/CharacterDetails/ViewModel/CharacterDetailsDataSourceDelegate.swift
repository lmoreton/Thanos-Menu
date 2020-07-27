//
//  CharacterDetailsDataSourceDelegate.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class CharacterDetailsDataSourceDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var loadMore: (() -> Void)?
    var viewModel: CharacterDetailsViewModelProtocol
    
    init(viewModel: CharacterDetailsViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.details.details.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.details.details[section]?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ThanosMenuTableViewCell.reuseIdentifier, for: indexPath) as? ThanosMenuTableViewCell else { fatalError(ThanosMenuTableViewCell.reuseIdentifier) }

        cell.configure(with: viewModel.character)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.details.details[section]?.first?.type?.rawValue.capitalized ?? ""
    }
}

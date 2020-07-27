//
//  HomeTableViewCell.swift
//  thanos menu
//
//  Created by Lucas Moreton on 23/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class ThanosMenuTableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var characterImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.backgroundColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    var viewModel: ThanosMenuCellViewModel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViewConfiguration()
        
        viewModel = ThanosMenuCellViewModel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        viewModel = ThanosMenuCellViewModel()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        viewModel.cancelDownload(for: viewModel.downloadedImageToken)
        characterImageView.image = nil
    }
}

extension ThanosMenuTableViewCell {
    func configure(with character: CharacterProtocol) {
        nameLabel.text = character.name
        
        let imageURL = URL(string: character.thumbnail.fullPath)
        downloadImage(from: imageURL)
    }
}

private extension ThanosMenuTableViewCell {
    func downloadImage(from url: URL?) {
        viewModel.downloadImage(from: url) { [weak self] result in
            switch result {
            case .success:
                self?.characterImageView.image = self?.viewModel.characterImage
            case .failure:
                break
            }
        }
    }
    
    func cancelDownload(for uuid: UUID) {
        viewModel.cancelDownload(for: uuid)
    }
}

extension ThanosMenuTableViewCell: ViewCoding {
    
    func configureViews() {
        backgroundColor = .systemBackground
    }
    
    func buildViewHierarchy() {
        contentStackView.addArrangedSubview(nameLabel)
        self.contentView.addSubview(contentStackView)
        self.contentView.addSubview(characterImageView)
    }
    
    func setupConstraints() {
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
        
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            characterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            characterImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.32),
            
            contentStackView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: padding),
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }
}

//
//  ThanosMenuCellViewModel.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

protocol ThanosMenuCellViewModelProtocol {
    var characterImage: UIImage? { get }
    var downloadedImageToken: UUID? { get }
    func downloadImage(from url: URL?, completion: @escaping (Result<Void, NetworkError>) -> Void)
    func cancelDownload(for uuid: UUID?)
}

final class ThanosMenuCellViewModel {
    var characterImage: UIImage?
    var imageDownloadManager: ImageDownloadManagerProtocol?
    var downloadedImageToken: UUID?
    
    init(imageDownloadManager: ImageDownloadManagerProtocol = ImageDownloadManager()) {
        self.imageDownloadManager = imageDownloadManager
    }
}

extension ThanosMenuCellViewModel: ThanosMenuCellViewModelProtocol {
    func downloadImage(from url: URL?, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        
        downloadedImageToken =  imageDownloadManager?.downloadImage(url: url) { result in
            switch result {
            case let .success(contactImage):
                self.characterImage = contactImage
                completion(.success(Void()))
            case .failure:
                completion(.failure(.parseError))
            }
        }
    }
    
    func cancelDownload(for uuid: UUID?) {
        if let uuid = uuid {
            imageDownloadManager?.cancelDownload(for: uuid)
        }
    }
}

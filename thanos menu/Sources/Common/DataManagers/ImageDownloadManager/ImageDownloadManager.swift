//
//  ImageDownloadManager.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

final class ImageDownloadManager {
    
    private let session: URLSession
    private var downloadTask: URLSessionDownloadTask!
    var downloadedImages = [URL: UIImage]()
    var runningRequests = [UUID: URLSessionDownloadTask]()

    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }
}

extension ImageDownloadManager: ImageDownloadManagerProtocol {
    func downloadImage(url: URL?, result: @escaping DownloadedImageResultHandler) -> UUID? {
        
        guard let url = url else {
            result(.failure(.badRequest))
            return nil
        }
                
        let uuid = UUID()
                
        downloadTask = session.downloadTask(with: url) { url, response, error in
            
            defer { self.runningRequests.removeValue(forKey: uuid) }
            
            guard
                let url = url,
                let imageData = try? Data(contentsOf: url),
                let image = UIImage(data: imageData)
            else {
                result(.failure(.parseError))
                return
            }
            
            
            self.downloadedImages[url] = image
            
            DispatchQueue.main.async {
                result(.success(image))
            }
            
        }
        
        downloadTask.resume()
        runningRequests[uuid] = downloadTask
        return uuid
    }
    
    func cancelDownload(for uuid: UUID) {
        runningRequests[uuid]?.cancel()
        runningRequests.removeValue(forKey: uuid)
    }
}

//
//  ImageDownloadManagerProtocol.swift
//  thanos menu
//
//  Created by Lucas Moreton on 26/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

typealias DownloadedImageResultHandler = (Result<UIImage, NetworkError>) -> Void

protocol ImageDownloadManagerProtocol{
    var downloadedImages: [URL: UIImage] { get }
    var runningRequests: [UUID: URLSessionDownloadTask] { get }
    func downloadImage(url: URL?, result: @escaping DownloadedImageResultHandler) -> UUID?
    func cancelDownload(for uuid: UUID)
}

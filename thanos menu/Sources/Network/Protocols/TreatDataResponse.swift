//
//  TreatDataResponse.swift
//  thanos menu
//
//  Created by Lucas Moreton on 22/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol TreatDataResponse: TreatJSONDecode {
    func treatDataResponse<T: Decodable>(
        data: Data,
        response: HTTPURLResponse,
        result: ResultHandler<T>
    )
}

extension TreatDataResponse {
    func treatDataResponse<T: Decodable>(
        data: Data,
        response: HTTPURLResponse,
        result: ResultHandler<T>
    ) {
        switch response.statusCode {
        case 200...299:
            treatJSONDecode(data: data, result: result)
        case 400...499:
            result(.failure(.unauthorized))
        case 500...599:
            result(.failure(.badRequest))
        case 600:
            result(.failure(.outDated))
        default:
            result(.failure(.unknown))
        }
    }
}

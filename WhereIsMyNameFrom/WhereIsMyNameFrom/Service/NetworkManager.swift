//
//  NetworkManager.swift
//  WhereIsMyNameFrom
//
//  Created by Pedro Boga on 03/11/22.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case invalidRequest
}

class NetworkManager {
    private let originURL = "https://api.nationalize.io?name="
    
    func nameOrigin(name: String) async throws -> Origin {
        guard let url = URL(string: originURL + name) else {
            throw ApiError.invalidUrl
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Origin.self, from: data)
        } catch {
            throw ApiError.invalidRequest
        }
    }
}

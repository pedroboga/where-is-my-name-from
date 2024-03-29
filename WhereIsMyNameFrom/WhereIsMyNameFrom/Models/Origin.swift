//
//  Origin.swift
//  WhereIsMyNameFrom
//
//  Created by Pedro Boga on 03/11/22.
//

import Foundation

struct Origin: Codable, Identifiable {
    let id = UUID()
    let country: [Country]
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case country, name
    }
}

struct Country: Codable, Identifiable {
    var id = UUID()
    let countryID: String
    var probability: Double
    var probabilityPercentage: Double {
            return self.probability * 100
        }

    enum CodingKeys: String, CodingKey {
        case countryID = "country_id"
        case probability
    }
}

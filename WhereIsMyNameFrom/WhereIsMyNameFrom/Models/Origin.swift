//
//  Origin.swift
//  WhereIsMyNameFrom
//
//  Created by Pedro Boga on 03/11/22.
//

import Foundation

struct Origin: Codable {
    let country: [Country]
    let name: String
}

struct Country: Codable {
    let countryID: String
    let probability: Double

    enum CodingKeys: String, CodingKey {
        case countryID = "country_id"
        case probability
    }
}

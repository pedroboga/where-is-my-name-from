//
//  Model.swift
//  Where is Your Name From
//
//  Created by Pedro Boga on 30/10/21.
//

import Foundation

struct Name: Codable {
    let name: String?
    let country: [Country]?
}

struct Country: Codable {
    let countryId: String?
    let probability: Double?
}

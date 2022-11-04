//
//  MainViewModel.swift
//  WhereIsMyNameFrom
//
//  Created by Pedro Boga on 03/11/22.
//

import SwiftUI

@MainActor
class MainViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var name = ""
    @Published var origin: Origin = Origin(country: [], name: "")
    
    func search(name: String) {
        isLoading = true
        Task {
            do {
                origin = try await NetworkManager().nameOrigin(name: name)
            } catch {
                isLoading = false
            }
        }
    }
}

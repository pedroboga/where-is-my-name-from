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
    @Published var items: [Origin] = []
    private let itemsKey: String = "searchHistory"
    
    
    func search(name: String) {
        isLoading = true
        Task {
            do {
                origin = try await NetworkManager().nameOrigin(name: name)
                addItem(item: origin)
            } catch {
                isLoading = false
            }
        }
    }
    
    func addItem(item: Origin) {
        if items.count >= 10 {
            items.removeLast()
        }
        items.append(item)
        saveItems()
    }
    
    func getItemsHistory() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let history = try? JSONDecoder().decode([Origin].self, from: data)
        else { return }
        self.items = history
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}

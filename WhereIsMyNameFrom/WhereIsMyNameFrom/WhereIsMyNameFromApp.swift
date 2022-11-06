//
//  WhereIsMyNameFromApp.swift
//  WhereIsMyNameFrom
//
//  Created by Pedro Boga on 03/11/22.
//

import SwiftUI

@main
struct WhereIsMyNameFromApp: App {
    @StateObject var mainViewModel: MainViewModel = MainViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(mainViewModel)
        }
    }
}

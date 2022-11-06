//
//  MainView.swift
//  WhereIsMyNameFrom
//
//  Created by Pedro Boga on 03/11/22.
//

import SwiftUI
import Charts

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State var nameSearch: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if nameSearch.isEmpty {
                    Text("Type your name and search its origins!")
                        .font(.title3)
                        .frame(height: 200)
                } else {
                    Chart(viewModel.origin.country) { country in
                        BarMark(
                            x: .value("Country", country.countryID),
                            y: .value("Probability", country.probabilityPercentage)
                        )
                        .annotation(position: .top) {
                            FlagView(id: country.countryID)
                        }
                        .foregroundStyle(by: .value("Probability", country.probabilityPercentage))
                    }
                    //.chartYScale(domain: 0...100)
                    .frame(height: 200)
                    .padding()
                }
                Spacer()
                Text("Search history:")
                    .font(.title2)
                    .bold()
                List(viewModel.items) { item in
                    SearchHistoryCell(object: item)
                }
                .listStyle(.plain)
                Spacer()
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Where is my name from?")
                        .font(.title)
                        .bold()
                }
            })
            .searchable(text: $nameSearch)
        }
        .onSubmit(of: .search) {
            Task {
                viewModel.search(name: nameSearch)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainViewModel())
    }
}

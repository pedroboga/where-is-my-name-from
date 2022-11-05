//
//  MainView.swift
//  WhereIsMyNameFrom
//
//  Created by Pedro Boga on 03/11/22.
//

import SwiftUI
import Charts

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State var nameSearch: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
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
                Spacer()
                
                List(viewModel.items) { item in
                    Text("\(item.name)")
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Where is my name from?")
                        .font(.title)
                        .bold()
                }
            })
            //.navigationTitle("Where is my name from?")
            .searchable(text: $nameSearch)
        }
        .onAppear {
            viewModel.getItemsHistory()
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
    }
}

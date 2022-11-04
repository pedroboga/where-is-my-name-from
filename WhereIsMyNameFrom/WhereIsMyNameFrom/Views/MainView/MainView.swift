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
//                List {
//                    ForEach(viewModel.origin.country) { country in
//                        Text("\(country.countryID) - \(country.probability)")
//                    }
//                }
                Chart(viewModel.origin.country) { country in
                    BarMark(
//                        x: .value("Country", country.countryID),
//                        y: .value("Probability", country.probability),
//                        stacking: .center
                        x: .value("Probability", country.probability),
                        y: .value("Country", country.countryID)
                    )
                    .annotation(position: .trailing) {
                                        Image(systemName: "figure.stand")
                                            .foregroundColor(.indigo)
                                    }
                    .foregroundStyle(by: .value("Probability", country.probability))
                }
                .frame(height: 200)
                .padding()
                Spacer()
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

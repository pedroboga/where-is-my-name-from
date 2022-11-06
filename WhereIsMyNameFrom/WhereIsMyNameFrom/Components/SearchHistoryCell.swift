//
//  SearchHistoryCell.swift
//  WhereIsMyNameFrom
//
//  Created by Pedro Boga on 05/11/22.
//

import SwiftUI

struct SearchHistoryCell: View {
    @State var object: Origin
    var body: some View {
        HStack {
            Text(object.name)
                .frame(width: 100, alignment: .leading)
                .padding(.trailing, 20)
            FlagView(id: object.country[0].countryID)
            Text("\(String(format: "%.f", object.country[0].probabilityPercentage)) %")
        }
    }
}

struct SearchHistoryCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistoryCell(object: Origin(country: [], name: ""))
    }
}

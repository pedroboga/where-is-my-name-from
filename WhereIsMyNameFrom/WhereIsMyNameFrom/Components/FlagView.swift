//
//  FlagView.swift
//  WhereIsMyNameFrom
//
//  Created by Pedro Boga on 04/11/22.
//

import SwiftUI

struct FlagView: View {
    var id: String = ""
    var body: some View {
        AsyncImage(url: NetworkManager().getFlag(id: id)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
        } placeholder: {
            Rectangle()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
        }
            
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView()
    }
}

//
//  Searcher.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 27.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct Searcher: View {
    let label: String
    @Binding var text: String

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass").font(.body)
                TextField(label, text: $text)
            }.padding(10)
            .background(Color("Color1"))
            .cornerRadius(20)
            
            Button(action: {}) {
                Image("mic").renderingMode(.original)
            }
        }
    }
}

struct Searcher_Previews: PreviewProvider {
    static var previews: some View {
        Searcher(label: "Search Groceries", text: .constant(""))
    }
}

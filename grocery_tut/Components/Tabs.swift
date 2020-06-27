//
//  Tabs.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 25.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

var tabs = ["Home","Wishlist","Cart"]

struct Tabs: View {
    @Binding var selected: String

    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                VStack(spacing: 10) {
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 5)
                        .overlay(
                            Capsule()
                                .fill(self.selected == tab ? Color("Color") : Color.clear)
                                .frame(width: 55, height: 5)
                        )
                    
                    Button(action: { self.selected = tab }) {
                        VStack {
                            Image(tab).renderingMode(.original)
                            Text(tab).foregroundColor(.black)
                        }
                    }
                }
            }
        }.padding(.horizontal)
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs(selected: .constant(tabs[0]))
    }
}

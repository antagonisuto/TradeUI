//
//  ContentView.swift
//  YandexProject
//
//  Created by Marfa Lamova on 3/29/21.
//  Copyright © 2021 Madina Saparbayeva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   var body: some View {
        TradeList()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

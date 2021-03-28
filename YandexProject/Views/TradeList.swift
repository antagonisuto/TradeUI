//
//  TradeList.swift
//  YandexProject
//
//  Created by Marfa Lamova on 3/29/21.
//  Copyright © 2021 Madina Saparbayeva. All rights reserved.
//

import SwiftUI

struct TradeList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var searchText = ""
    
    
    var filteredTrades: [Trade] {
        modelData.trades.filter { trade in
            (!showFavoritesOnly || trade.isFavorite)
        }
    }
    
    var body: some View {
        VStack{
           
            NavigationView {
                List
                    {
                    SearchBar(text: $searchText)
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                    }
                        ForEach(filteredTrades.filter({searchText.isEmpty ? true : ($0.name.contains(searchText) || $0.symbol.contains(searchText))})) { trade in
                        NavigationLink(destination: TradeDetail(trade: trade)){
                            TradeRow(trade: trade)
                        }
                    }
                    .padding(.bottom)
                }
                .navigationBarHidden(true)
                .navigationBarItems(trailing: EmptyView())
                .onAppear {
                    UITableView.appearance().separatorColor = .clear }
            }
        }
    }
}

struct TradeList_Previews: PreviewProvider {
    static var previews: some View {
        TradeList()
    }
}

//
//  TradeDetail.swift
//  YandexProject
//
//  Created by Marfa Lamova on 3/29/21.
//  Copyright © 2021 Madina Saparbayeva. All rights reserved.
//

import SwiftUI

struct TradeDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var modelData: ModelData
    var trade: Trade
    
    var tradeIndex: Int {
        modelData.trades.firstIndex(where: { $0.id == trade.id })!
    }
    
    var btnBack : some View {
        HStack{
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image("Back")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
            }
            
            Text(trade.name)
                   .foregroundColor(.black)
               
            Spacer()

            FavoriteButton(isSet: $modelData.trades[tradeIndex].isFavorite)
        }.frame(alignment: .trailing)
    }

    var body: some View {
        VStack {
            HStack {
                Text(trade.name)
                    .font(.title)
                    .foregroundColor(.primary)
                FavoriteButton(isSet: $modelData.trades[tradeIndex].isFavorite)
            }
            Text("\(trade.currency)\(trade.currentValue)")
                .font(.title)
                .bold()
            if (trade.currentValue - trade.previousValue > 0) {
                 Text("+\(trade.currency)\(trade.currentValue - trade.previousValue)")
                    .foregroundColor(Color.green)
            } else {
                Text("-\(trade.currency)\(abs(trade.currentValue - trade.previousValue))")
                .foregroundColor(Color.red)
            }
            
            Spacer()
            
            Text("Buy for $132.04")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .padding()
        //.navigationBarTitle(trade.symbol)
    }
}

struct TradeDetail_Previews: PreviewProvider {
    static var previews: some View {
        TradeDetail(trade: ModelData().trades[0])
    }
}

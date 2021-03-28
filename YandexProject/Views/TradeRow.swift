//
//  TradeRow.swift
//  YandexProject
//
//  Created by Marfa Lamova on 3/29/21.
//  Copyright © 2021 Madina Saparbayeva. All rights reserved.
//

import SwiftUI

struct TradeRow: View {
    
    var trade: Trade
    @State var rowPattern = false
    
    var body: some View {
        HStack {
            trade.image
                .resizable()
                .frame(width: 52, height: 52)
            
            VStack (alignment: .leading){
                HStack {
                    Text(trade.symbol)
                        .bold()
                    
                    if trade.isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                
                Text(trade.name)
                    .font(.subheadline)
            }
            
            Spacer()
            
            VStack {
                Text("\(trade.currency)\(trade.currentValue)")
                .bold()

                if (trade.currentValue - trade.previousValue > 0) {
                     Text("+\(trade.currency)\(trade.currentValue - trade.previousValue)")
                        .foregroundColor(Color.green)
                } else {
                    Text("-\(trade.currency)\(abs(trade.currentValue - trade.previousValue))")
                    .foregroundColor(Color.red)
                }
                   
            }
            
        }
        .cornerRadius(10)
        .background(rowPattern ? Color.gray : Color.clear)
    }
}

struct TradeRow_Previews: PreviewProvider {
    static var trades = ModelData().trades
    
    static var previews: some View {
        TradeRow(trade: trades[1])
            .previewLayout(.fixed(width: 328, height: 68))
    }
}

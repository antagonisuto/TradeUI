//
//  Trade.swift
//  YandexProject
//
//  Created by Marfa Lamova on 3/29/21.
//  Copyright © 2021 Madina Saparbayeva. All rights reserved.
//

import Foundation
import SwiftUI

struct Trade: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var symbol: String
    var currentValue: Int
    var previousValue: Int
    var isFavorite: Bool
    var currency: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}


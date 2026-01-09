//
//  Product.swift
//  POSApp
//
//  Created by Sai brahmam on 05/01/26.
//

import Foundation

struct Product: Identifiable,Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
}

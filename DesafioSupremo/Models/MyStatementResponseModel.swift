//
//  MyStatementResponseModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation

struct MyStatementResponseModel: Codable {
        var items: [Item]
}

struct Item: Codable {
    var createdAt: Date?
    var id: String?
    var amount: Int?
    var to: String?
    var description: String?
    var tType: ItemType
    var from: String?
    var bankName: String?
}

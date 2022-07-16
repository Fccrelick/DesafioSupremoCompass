//
//  DetailStatementResponseModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import Foundation

struct DetailStatementResponseModel: Codable {
    var createdAt: Date?
    var tType: ItemType
    var authentication: String?
    var description: String?
    var from: String?
    var id: String?
    var amount: Int?
    var bankName: String?
}

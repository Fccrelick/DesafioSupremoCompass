//
//  DetailStatementResponseModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import Foundation

struct DetailStatementResponseModel: Codable {
    var createdAt: Date?
    var tType: String?
    var authentication: String?
    var description: String?
    var from: String?
    var id: String?
    var amount: Int?
    var bankName: String?
}

extension DetailStatementResponseModel {
    var itemType: ItemType? {
        switch tType {
        case ItemType.transferOut.rawValue.uppercased():
            return ItemType.transferOut
        case ItemType.transferIn.rawValue.uppercased():
            return ItemType.transferIn
        case ItemType.pixCashIn.rawValue.uppercased():
            return ItemType.pixCashIn
        case ItemType.pixCashOut.rawValue.uppercased():
            return ItemType.pixCashOut
        case ItemType.transferIn.rawValue.uppercased():
            return ItemType.bankSlipCashIn
        default:
            return nil
        }
    }
}

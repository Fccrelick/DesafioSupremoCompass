//
//  MyStatementResponseModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation

enum ItemType: String, CaseIterable {
    case transferOut
    case transferIn
    case pixCashIn
    case pixCashOut
    case bankSlipCashIn
}

struct MyStatementResponseModel: Codable {
        var items: [Item]
}

struct Item: Codable {
    var createdAt: Date?
    var id: String?
    var amount: Int?
    var to: String?
    var description: String?
    var tType: String
    var from: String?
    var bankName: String?

}

extension Item {
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

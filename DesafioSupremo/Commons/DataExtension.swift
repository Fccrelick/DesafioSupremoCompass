//
//  DataExtension.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import Foundation

extension Data {
    func toInt() -> Int {
        let value = self.withUnsafeBytes {
            $0.load(as: Int.self)
        }
        return value
    }
}

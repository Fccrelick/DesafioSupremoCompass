//
//  IntExtension.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import Foundation

extension Int {
    func toData() -> Data {
        let data = withUnsafeBytes(of: self) {
             Data($0)
        }
        return data
    }
}

//
//  MyBalanceRequest.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation

struct MyBalanceRequest: DataRequest {
    typealias Response = MyBalanceResponseModel

    var url: String = {
        let baseURL: String = "https://bank-statement-bff.herokuapp.com"
        let path: String = "/myBalance/"
        return baseURL + path
    }()

    var method: HTTPMethod{
        .get
    }

    var headers: [String : String] {
        [
            "token" : LocaleKeys.token.localized
        ]
    }

    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        let response = try decoder.decode(MyBalanceResponseModel.self, from: data)
        return response
    }
}

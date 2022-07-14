//
//  MyBalanceRequest.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation

struct MyBalanceRequest: DataRequest {
    typealias Response = MyBalanceResponseModel

    private let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"

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
            "token" : token
        ]
    }

    func decode(_ data: Data) throws -> MyBalanceResponseModel {
        let decoder = JSONDecoder()
        let response = try decoder.decode(MyBalanceResponseModel.self, from: data)
        return response
    }
}

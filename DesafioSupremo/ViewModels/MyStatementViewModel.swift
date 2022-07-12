//
//  MyStatementViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation


protocol StatementViewModel {
    var MyStatements: [Item]? { set get }
    var onFetchStatementSucceed: (() -> Void)? { set get }
    var onFetchStatementFailure: ((Error) -> Void)? { set get }
    func fetchMyStatement()
}

final class MyStatementViewModel: StatementViewModel {
    private let networkService: NetworkService

    var MyStatements: [Item]?

    var onFetchStatementSucceed: (() -> Void)?

    var onFetchStatementFailure: ((Error) -> Void)?

    init(networkService: NetworkService){
        self.networkService = networkService
        fetchMyStatement()
    }

    func fetchMyStatement() {
        let request = MyStatementRequest()
        networkService.request(request) { [weak self] result in
            switch result {
            case .success(let statements):
                self?.MyStatements = statements.items
                self?.onFetchStatementSucceed?()
            case .failure(let error):
                self?.onFetchStatementFailure?(error)
            }
        }
    }
}

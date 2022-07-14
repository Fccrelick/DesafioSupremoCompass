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
    func fetchMyStatement(pagination: Bool, withIndex index: Int)
}

final class MyStatementViewModel: StatementViewModel {
    private let networkService: NetworkService

    var MyStatements: [Item]?

    var onFetchStatementSucceed: (() -> Void)?

    var onFetchStatementFailure: ((Error) -> Void)?

    var isPaginating = false

    init(networkService: NetworkService){
        self.networkService = networkService
        fetchMyStatement(withIndex: 0)
    }

    func fetchMyStatement(pagination: Bool = false, withIndex index: Int) {
        let request = MyStatementRequest(index: index)

        if pagination{
            isPaginating = true
        }

        networkService.request(request) { [weak self] result in
            switch result {
            case .success(let statements):
                if (self?.MyStatements) != nil {
                    self?.MyStatements?.append(contentsOf: statements.items)
                    print("added new items")
                } else {
                    self?.MyStatements = statements.items
                }
                self?.onFetchStatementSucceed?()
                if pagination {
                    self?.isPaginating = false
                }
            case .failure(let error):
                self?.onFetchStatementFailure?(error)
                if pagination {
                    self?.isPaginating = false
                }
            }
        }
    }
}

//
//  DetailStatementViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import Foundation

protocol DetailStatementViewModel {
    var item: Item { get }
    var details: DetailStatementResponseModel? { set get }
    var onFetchDetailsSucceed: (() -> Void)? { set get }
    var onFetchDetailsFailure: ((Error) -> Void)? { set get }
    func fetchMyStatement(withID ID: String?)
}

class MyDetailStatementViewModel: DetailStatementViewModel {
    private let networkService: NetworkService

    var item: Item

    var details: DetailStatementResponseModel?

    var onFetchDetailsSucceed: (() -> Void)?

    var onFetchDetailsFailure: ((Error) -> Void)?

    init(networkService: NetworkService, item: Item){
        self.networkService = networkService
        self.item = item
        fetchMyStatement(withID: item.id)
    }

    func fetchMyStatement(withID ID: String?) {
        guard let ID = ID else {
            return
        }

        let request = DetailStatementRequest(id: ID)
        networkService.request(request) { [weak self] result in
            switch result{
            case .success(let details):
                self?.details = details
                self?.onFetchDetailsSucceed?()
            case .failure(let error):
                self?.onFetchDetailsFailure?(error)
            }
        }
    }
}

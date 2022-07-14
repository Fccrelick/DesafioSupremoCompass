//
//  MyBalanceViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation

protocol BalanceViewModel {
    var amount: Int? { set get }
    var onFetchBalanceSucceed: (() -> Void)? { set get }
    var onFetchBalanceFailure: ((Error) -> Void)? { set get }
    func fetchMyBalance()
}

final class MyBalanceViewModel: BalanceViewModel {
    private let networkService: NetworkService

    var amount: Int?

    var onFetchBalanceSucceed: (() -> Void)?

    var onFetchBalanceFailure: ((Error) -> Void)?

    init(networkService: NetworkService){
        self.networkService = networkService
        fetchMyBalance()
    }

    func fetchMyBalance() {
        let request = MyBalanceRequest()
        networkService.request(request) { [weak self] result in
            switch result {
            case .success(let amount):
                KeychainHelper.standard.save(amount.amount.toData(), service: "balance")
                self?.onFetchBalanceSucceed?()
            case .failure(let error):
                self?.onFetchBalanceFailure?(error)
            }
        }
    }
}


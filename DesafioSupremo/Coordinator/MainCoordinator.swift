//
//  MainCoordinator.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?

    var children: [Coordinator]? = nil

    var balanceViewModel = MyBalanceViewModel(networkService: DefaultNetworkService())
    var statementViewModel = MyStatementViewModel(networkService: DefaultNetworkService())

    func eventOccurred(with type: Event) {
        switch type {
        case .statementCellTapped(let item):
            var vc: UIViewController & Coordinating = DetailViewController()

            vc.coordinator = self

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func start() {
        var vc: UITableViewController & Coordinating = StatementController(balanceViewModel: balanceViewModel,
                                                                           statementViewModel: statementViewModel)

        vc.coordinator = self

        navigationController?.setViewControllers([vc], animated: true)
    }
}

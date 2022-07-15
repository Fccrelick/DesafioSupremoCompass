//
//  Coordinator.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import UIKit

enum Event{
    case statementCellTapped(item: Item)
    case shareButtonTapped(imagesToShare: [AnyObject])
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }

    func eventOccurred(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

//
//  DetailViewController.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 12/07/22.
//

import UIKit

class DetailViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?

    var detailView = DetailView()

    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        view.backgroundColor = .purple
    }
}

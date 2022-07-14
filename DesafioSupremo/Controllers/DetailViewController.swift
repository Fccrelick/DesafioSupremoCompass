//
//  DetailViewController.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 12/07/22.
//

import UIKit

class DetailViewController: UIViewController, Coordinating {
    //MARK: - Properties
    var coordinator: Coordinator?

    var detailStatementViewModel: DetailStatementViewModel

    var detailView = DetailView()

    // MARK: - Initializers
    init(detailStatementViewModel: DetailStatementViewModel) {
        self.detailStatementViewModel = detailStatementViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        view.backgroundColor = .purple
    }
}

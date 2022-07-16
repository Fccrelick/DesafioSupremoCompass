//
//  DetailViewController.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 12/07/22.
//

import UIKit

final class DetailViewController: UIViewController, Coordinating {
    //MARK: - Instance Properties

    var coordinator: Coordinator?

    var detailStatementViewModel: DetailStatementViewModel

    // MARK: - Views

    var detailView = DetailView()

    // MARK: - Initialization

    init(detailStatementViewModel: DetailStatementViewModel) {
        self.detailStatementViewModel = detailStatementViewModel
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Life Cycle

    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        detailStatementViewModel.delegate = self
        detailStatementViewModel.fetchMyStatement()
        setup()
    }

    // MARK: - Functions

    private func setup() {
        view.backgroundColor = ColorPalette.white
        detailView.delegate = self
    }

    private func takeDetailScreenshot() -> UIImage? {
        let layer = detailView.screenshotView.layer
        let scale = UIScreen.main.scale

        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);

        guard let currentContext = UIGraphicsGetCurrentContext() else {
            return nil
        }

        layer.render(in: currentContext)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return screenshot

    }
}

// MARK: - DetailViewDelegate

extension DetailViewController: DetailViewDelegate {
    func handleShareTapped() {
        let image = takeDetailScreenshot()

        guard let image = image else {
            return
        }

        var imagesToShare = [AnyObject]()
        imagesToShare.append(image)

        coordinator?.eventOccurred(with: .shareButtonTapped(imagesToShare: imagesToShare))
    }
}

// MARK: - DetailFetchResultDelegate

extension DetailViewController: DetailFetchResultDelegate {
    func detailFetchSuccess() {
        guard let details = self.detailStatementViewModel.details else {
            return
        }

        DispatchQueue.main.async {
            self.detailView.configure(withViewModel: DetailViewModel(details: details, item: self.detailStatementViewModel.item))
        }
    }

    func detailFetchFailure(error: Error) {

            DispatchQueue.main.async {
                self.coordinator?.eventOccurred(with: .apiError(message: error.localizedDescription))
            }

    }
}

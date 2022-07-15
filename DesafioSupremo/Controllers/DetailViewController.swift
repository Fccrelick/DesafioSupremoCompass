//
//  DetailViewController.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 12/07/22.
//

import UIKit

final class DetailViewController: UIViewController, Coordinating {
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

// MARK: - Lifecycle
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = ColorPalette.white
        detailView.delegate = self
        refreshDisplay()
    }

    // MARK: - Helpers
    private func refreshDisplay() {
        detailStatementViewModel.onFetchDetailsSucceed = {
            guard let details = self.detailStatementViewModel.details else {
                return
            }

            DispatchQueue.main.async {
                self.detailView.configure(withViewModel: DetailViewModel(details: details, item: self.detailStatementViewModel.item))
            }
        }
    }
}

// MARK: - DetailViewDelegate

extension DetailViewController: DetailViewDelegate {
    func handleShareTapped() {
        let image = screenShotMethod()

        guard let image = image else {
            return
        }

        var imagesToShare = [AnyObject]()
        imagesToShare.append(image)

        let activityViewController = UIActivityViewController(activityItems: imagesToShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        present(activityViewController, animated: true, completion: nil)
    }

    func screenShotMethod() -> UIImage? {
        let layer = detailView.screenshotView.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);

        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return screenshot

    }
}

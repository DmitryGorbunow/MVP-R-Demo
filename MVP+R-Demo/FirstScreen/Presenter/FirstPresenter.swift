//
//  FirstPresenter.swift
//  MVP+R-Demo
//
//  Created by Dmitry Gorbunow on 10/28/23.
//

import Foundation

protocol FirstPresenterProtocol {
    func loadView(controller: FirstViewController, view: FirstViewProtocol)
}

final class FirstPresenter {
    private let model: FirstModelProtocol
    private let router: Router
    private weak var controller: FirstViewController?
    private weak var view: FirstViewProtocol?

    struct Dependencies {
        let model: FirstModelProtocol
        let router: Router
    }

    init(dependencies: Dependencies) {
        self.model = dependencies.model
        self.router = dependencies.router
    }
}


private extension FirstPresenter {
    private func onTouched() {
        guard let view = view else { return }

        let modelData = view.getTextFieldData()
        self.model.setData(data: modelData)

        let viewModel = "The data: " + self.model.getData()
        self.view?.update(data: viewModel)
    }
    
    private func onTouchedGoToSecondVC() {
        self.router.next()
    }

    private func setHandlers() {
        self.view?.goToLoginHandler = { [weak self] in
            self?.onTouched()
        }
        self.view?.goToDemoHandler = { [weak self] in
            self?.onTouchedGoToSecondVC()
        }
    }
}

extension FirstPresenter: FirstPresenterProtocol {
    func loadView(controller: FirstViewController, view: FirstViewProtocol) {
        self.controller = controller
        self.view = view

        self.setHandlers()
    }
}

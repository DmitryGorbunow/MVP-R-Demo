//
//  FirstScreenAssembley.swift
//  MVP+R-Demo
//
//  Created by Dmitry Gorbunow on 10/29/23.
//

import UIKit

final class FirstScreenAssembley {
    static func build() -> UIViewController {
        let model = FirstModel()
        let router = Router()
        
        let presenter = FirstPresenter(
            dependencies: .init(model: model, router: router)
        )
        
        let controller = FirstViewController(
            dependencies: .init(presenter: presenter)
        )
        
        let targetController = SecondScreenAssembley.build()
        
        router.setRootController(controller: controller)
        router.setTargerController(controller: targetController)
        
        return controller
    }
}

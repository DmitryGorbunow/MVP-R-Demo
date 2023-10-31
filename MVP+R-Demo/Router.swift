//
//  Router.swift
//  MVP+R-Demo
//
//  Created by Dmitry Gorbunow on 10/28/23.
//

import UIKit

final class Router {
    private var controller: UIViewController?
    private var targertController: UIViewController?
    
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    
    func setTargerController(controller: UIViewController) {
        self.targertController = controller
    }
    
    func next() {
        guard let targertController = self.targertController else {
            return
        }
        
        self.controller?.navigationController?.pushViewController(targertController, animated: true)
    }
    
//    private let navigationViewController: UINavigationController
//       
//       init(navigationViewController: UINavigationController) {
//           self.navigationViewController = navigationViewController
//       }
//       
//       func showViewController(output: ViewOutput) {
//           let view = ViewController(output: output)
//           output.addView(input: view)
//           
//           navigationViewController.setViewControllers([view], animated: true)
//       }
//       
//       func showSecondViewController() {
//           let secondViewController = SecondViewController()
//           
//           navigationViewController.pushViewController(secondViewController, animated: false)
//       }

}

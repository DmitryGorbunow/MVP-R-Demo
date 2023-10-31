//
//  SceneDelegate.swift
//  MVP+R-Demo
//
//  Created by Dmitry Gorbunow on 10/27/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var navigationVc: UINavigationController?
    var vc: UIViewController?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        self.vc = FirstScreenAssembley.build()
        guard let vc = self.vc else { return }
        self.navigationVc = UINavigationController(rootViewController: vc)
        
        self.window?.rootViewController = self.navigationVc
        self.window?.makeKeyAndVisible()
    }
}


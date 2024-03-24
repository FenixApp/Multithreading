//
//  SceneDelegate.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 19.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = Task8()
        window?.makeKeyAndVisible()
    }
}


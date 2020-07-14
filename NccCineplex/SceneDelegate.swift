//
//  SceneDelegate.swift
//  NccCineplex
//
//  Created by User on 6/30/20.
//  Copyright © 2020 hung. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = setupTabBarController()
        window?.makeKeyAndVisible()
        
    }
    
    // viet ham setup UItabbarcontroller
    func setupTabBarController() -> UITabBarController {
        // khoi tao tabBarController
        let tabBar = UITabBarController()
        
        //khoi tao FirstViewController
        let firstVC = HomeViewController()
        firstVC.view.backgroundColor = .lightGray
        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "BUTTONHOME"), tag: 1)
        firstVC.tabBarItem.badgeValue = "N"
        
//        let navigationFirst = UINavigationController(rootViewController: firstVC)
        
        
        
        let secondVC = MovieScheduleViewController()
        secondVC.view.backgroundColor = .purple
        secondVC.tabBarItem = UITabBarItem(title: "Lịch chiếu", image: UIImage(named: "movie"), tag: 2)
        secondVC.tabBarItem.badgeValue = "H"
        
        let thirdVC = MovieTicketPriceViewController()
        thirdVC.view.backgroundColor = .green
        thirdVC.tabBarItem = UITabBarItem(title: "Khuyến mãi", image: UIImage(named: "BUTTONKM"), tag: 3)
        
        let fourVC = PromotionViewController()
        fourVC.view.backgroundColor = .yellow
        fourVC.tabBarItem = UITabBarItem(title: "Giá vé", image: UIImage(named: "iconTicket"), tag: 4)
        
        // them cac man hinh vao tabbarcontroller
        tabBar.setViewControllers([firstVC, secondVC, thirdVC, fourVC], animated: true)
        
        return tabBar
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}


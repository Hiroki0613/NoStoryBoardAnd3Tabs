//
//  SceneDelegate.swift
//  NoStoryBoardAnd3Tabs
//
//  Created by 近藤宏輝 on 2020/02/08.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        //didFinishLaunchingOptionと同じもの
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        //ナビゲーションコントローラーNCをそれぞれのViewControllerにembedIn(意味は”埋め込み”)
        //let HappyNC = UINavigationController(rootViewController: HappyVC())
        //let TabNC = UINavigationController(rootViewController: TabVC())
        //let GraceNC = UINavigationController(rootViewController: GraceVC())
        
        //タブにそれぞれのNavigationControllerを割り当てている
        //let tabbar = UITabBarController()
        //tabbar.viewControllers = [HappyNC, TabNC ,GraceNC]
    
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabbar()
        window?.makeKeyAndVisible()
    }
    
    //ナビゲーションコントローラーNCをそれぞれのViewControllerにembedIn(意味は”埋め込み”)
    //その際に、titleとtabBarItemを追加で実装
    func createHappyNC() -> UINavigationController {
        let happyVC = HappyVC()
        happyVC.title = "Happy"
        happyVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: happyVC)
    }
    
    func createTabNC() -> UINavigationController {
        let tabVC = TabVC()
        tabVC.title = "Tab"
        tabVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        return UINavigationController(rootViewController: tabVC)
    }
    
    
    func createGraceNC() -> UINavigationController {
        let graceVC = GraceVC()
        graceVC.title = "Grace"
        graceVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        
        return UINavigationController(rootViewController: graceVC)
    }
    
    
    func createTabbar() -> UITabBarController {
        //tabarをインスタンス化
        let tabbar = UITabBarController()
        //タブバーの色を緑色に変更する
        UITabBar.appearance().tintColor = .systemGreen
        //tabbarにつけるViewControllerを実装
        tabbar.viewControllers = [createHappyNC(), createTabNC(), createGraceNC()]
        
        return tabbar
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


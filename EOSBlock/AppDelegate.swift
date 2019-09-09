//
//  AppDelegate.swift
//  EOSBlock
//
//  Created by Jason wang on 9/7/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

// default lazy load
let appSession = AppSession()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // TODO: Coordinator Pattern
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let blockListController = EOSBlockListController()
        let vm = EOSBlockListViewModel(eosManager: appSession.eosManager)
        blockListController.viewModel = vm
        vm.delegate = blockListController
        let navigationController = UINavigationController(rootViewController: blockListController)
        window?.rootViewController = navigationController
        // TODO: END
        return true
    }

}


//
//  AppDelegate.swift
//  testMemoryLeakTCA
//
//  Created by NikitaMalevich on 7.09.23.
//

import ComposableArchitecture
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let store = Store(initialState: RootFeature.State()) { RootFeature() }
    private var viewStore: ViewStore<RootViewController.ViewState, RootViewController.ViewAction>?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        self.window = window
        let rootViewController = RootViewController(store: store)
        viewStore = rootViewController.viewStore
        window.rootViewController = rootViewController

        window.makeKeyAndVisible()

        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        viewStore?.send(.appDelegate(.didBecomeActive))
    }
}


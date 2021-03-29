//
//  AppDelegate.swift
//  RestaurantApp
//
//  Created by Daniel Coleman on 1/22/21.
//

import UIKit

// Why no @UIApplicationMain?  Because everything is in a library, and a library doesn't have a "main" entry point.  You have to define the "main" entry point in the executable.
// I don't know of a way to use the attribute to reference an AppDelegate class defined somewhere else, so I just provided an old-fashioned main.swift instead.
public class AppDelegate: UIResponder, UIApplicationDelegate {

    public let window = UIWindow()

    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window.makeKeyAndVisible()

        window.rootViewController = RestaurantMenuController()

        return true
    }
}


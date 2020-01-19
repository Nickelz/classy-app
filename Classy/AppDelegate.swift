//
//  AppDelegate.swift
//  Classy
//
//  Created by Ali Alateiyah on 05/06/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
	
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
		FirebaseApp.configure()
		
		let home = HomeVC()
        let calendar = CalendarVC()
        let courses = CoursesVC()
		let register = RegisterVC()
		
//		print(Auth.auth().currentUser?.email as Any)

        home.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), tag: 1)
        calendar.tabBarItem = UITabBarItem(title: "Calendar", image: #imageLiteral(resourceName: "cal"), tag: 2)
        courses.tabBarItem = UITabBarItem(title: "Courses", image: #imageLiteral(resourceName: "books"), tag: 3)

        window = UIWindow(frame: UIScreen.main.bounds)
        let base = BubbleTabBarController()
            base.viewControllers = [home, calendar, courses]
            base.tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            base.tabBar.backgroundColor = .white

		Auth.auth().addStateDidChangeListener { (_, user) in
			if user != nil {
				self.setRootViewController(base)
                home.ProfileName.text = "\(user!.displayName?.first!.uppercased() ?? user!.email!.first!.uppercased())"
				print(Auth.auth().currentUser!.email! as Any)
			} else {
				self.setRootViewController(register)
				print("RVC")
			}
		}

        for viewController in [home, calendar, courses] {
            viewController.view.backgroundColor = BACKGROUND_COLOR
        }
		
        return true
    }
	
	func setRootViewController(_ viewController: UIViewController) {
		self.window!.rootViewController = viewController
		self.window!.makeKeyAndVisible()
	}

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


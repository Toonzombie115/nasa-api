//
//  TabBar.swift
//  NASA-API-MVC
//
//  Created by Paco Arvizu on 27/05/25.
//

import UIKit

class TabBar: UITabBarController{
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setUpVCs()
    }


func setUpVCs(){
    viewControllers = [createViewController(for: APODViewController(), title: NSLocalizedString("APOD",comment: "Astronomy Picture Of the Day"), image: UIImage(systemName: "gyroscope")!),
                       createViewController(for: SearchViewController(), title: NSLocalizedString("Search", comment: "NASA Image and Video Library"), image: UIImage(systemName: "magnifyingglass")!)
    ]
}

fileprivate func createViewController(for rootViewController: UIViewController,
                                      title: String,
                                      image: UIImage) -> UIViewController {
    let viewController = UINavigationController(rootViewController: rootViewController)
    viewController.tabBarItem.title = title
    viewController.tabBarItem.image = image
    viewController.navigationBar.prefersLargeTitles = true
    return viewController
}
}

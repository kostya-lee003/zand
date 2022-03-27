//
//  ViewController.swift
//  Zand
//
//  Created by Kostya Lee on 13/03/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded a Main tab bar")
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SavedPostsViewController())
        let vc3 = UINavigationController(rootViewController: BookedServicesViewController())
        let vc4 = UINavigationController(rootViewController: MapViewController())
        let vc5 = UINavigationController(rootViewController: ClientProfileViewController())
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
        
        tabBar.tintColor = UIColor.ZandPinkColor
        tabBar.backgroundColor = .systemBackground
        tabBar.unselectedItemTintColor = .lightGray
         
        vc1.tabBarItem.image = UIImage(named: "Scissors")
        vc2.tabBarItem.image = UIImage(named: "Heart")
        vc3.tabBarItem.image = UIImage(named: "Note")
        vc4.tabBarItem.image = UIImage(named: "Fire")
        vc5.tabBarItem.image = UIImage(named: "User")
        
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        tabBar.frame.size.height = 120
        tabBar.frame.origin.y = view.frame.height - 120
    }

}

extension MainTabBarViewController {
    
}

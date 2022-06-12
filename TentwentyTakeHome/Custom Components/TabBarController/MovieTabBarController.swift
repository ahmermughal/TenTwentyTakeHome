//
//  MovieTabBarController.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit

class MovieTabBarController: UITabBarController {
    
    // MARK: Override functions
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        layoutBackground()

        self.viewControllers = [createDashboardNC(), createWatchNC(), createMediaLibraryNC(), createMoreNC()]
        selectedIndex = 1
    }
    
    // MARK: Functions
    func createDashboardNC() -> UINavigationController {
        let vc = SearchVC()
        vc.tabBarItem = UITabBarItem(title: StringConstants.dashboard, image: MovieImages.dashboardIcon, tag: 0)
        return UINavigationController(rootViewController: vc)
    }
    
    func createWatchNC() ->  UINavigationController {
        let vc = WatchVC()
        vc.tabBarItem = UITabBarItem(title: StringConstants.watch, image: MovieImages.watchIcon, tag: 1)
        return UINavigationController(rootViewController: vc)
    }
    

    func createMediaLibraryNC() -> UINavigationController {
        let vc = MovieDetailsVC()
        vc.tabBarItem = UITabBarItem(title: StringConstants.mediaLibrary, image: MovieImages.mediaIcon, tag: 2)
        return UINavigationController(rootViewController: vc)
    }
    
    func createMoreNC() -> UINavigationController {
        let vc = WatchVC()
        vc.tabBarItem = UITabBarItem(title: StringConstants.more, image: MovieImages.moreIcon, tag: 1)
        return UINavigationController(rootViewController: vc)
    }
    
    
}

// MARK: UI Setup
extension MovieTabBarController{
    
    
    private func configure(){
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().isTranslucent = false
    }
    
    private func layoutBackground(){
        
        let bgView = UIImageView(image: UIImage(named: "tab-bg"))
        bgView.translatesAutoresizingMaskIntoConstraints = false
        self.tabBar.addSubview(bgView)
        self.tabBar.sendSubviewToBack(bgView)

        NSLayoutConstraint.activate([
        
            bgView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -16),
            bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
}

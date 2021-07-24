//
//  AppCordinator.swift
//  antigram
//
//  Created by Gabriel Puppi on 22/07/21.
//

import UIKit


protocol AppCoordinatorDelegate: AnyObject {
    
    func presentLogIn()
    
    func presentHome()
    
    func presentEnding()
    
    func presentSettings()
    
    func presentStorie(item: StorieItem)
    
    func sync(state: AppCoordinatorState)
    
    
}

class AppCoordinator {
    
    weak var window: UIWindow?
    var state: AppCoordinatorState?
    
    init(window: UIWindow) {
        
        self.window = window
        
    }
    
    
    
    func sync(state: AppCoordinatorState) {
        
        self.state = state
        
    }
    
    
    
    func start() {
        
        presentLogIn()
        
   }
    
    func createLogInVC() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? LoginViewController else {
            
            fatalError()
        }
        
        vc.coordinator = self
        return vc
        
      }
    
    func createEndingVC() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "End", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? EndViewController else {
            
            fatalError()
        }
        
        vc.coordinator = self
        return vc
        
      }
    
    func createTabBarVC() -> UITabBarController {
        
        let tabController = UITabBarController()
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        guard let homeVC = homeStoryboard.instantiateInitialViewController() as? HomeViewController else {
           fatalError()
        }
        homeVC.coordinator = self
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let configStoryboard = UIStoryboard(name: "Config", bundle: nil)
        guard let configVC = configStoryboard.instantiateInitialViewController() as? ConfigViewController else {
           fatalError()
        }
        configVC.coordinator = self
        configVC.title = "Settings"
        
        configVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.white
        
        navVC.pushViewController(configVC, animated: false)
        
        tabController.viewControllers = [homeVC, navVC]
        tabController.tabBar.tintColor = .black
        tabController.tabBar.barTintColor = UIColor.white
        return tabController
  }
    
    func createStorieVC(item: StorieItem) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "StorieView", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? StorieViewController else {
            
            fatalError()
        }
        vc.storieItem = item
        return vc
        
    }
    
}


extension AppCoordinator: AppCoordinatorDelegate {
    
    
    func presentStorie(item: StorieItem) {
        guard state != .storie else { return }
        let storieVC = createStorieVC(item: item)
        storieVC.modalPresentationStyle = .fullScreen
        window?.rootViewController?.present(storieVC, animated: true, completion: nil)
        
    
    }
    
   
    func presentLogIn() {
        guard state != .login else { return }
        let loginVC = createLogInVC()
        window?.rootViewController = loginVC
        state = .login
 }
    
    func presentHome() {
       
      
        guard state != .home else { return }
       
        
        if let state = state, state.isTab {
            
       
            guard let tabVC = window?.rootViewController as? UITabBarController else { return }
            
            tabVC.selectedIndex = 0
            
        } else {
            
         
            let tabVC = createTabBarVC()
            window?.rootViewController = tabVC
            
        }
        
        state = .home
    }
    
    func presentSettings() {
        
        guard state != .settings else { return }
        
        if let state = state, state.isTab {
            
            guard let tabVC = window?.rootViewController as? UITabBarController else { return }
            
            tabVC.selectedIndex = 1
        
        } else {
            
            let tabVC = createTabBarVC()
            window?.rootViewController = tabVC
            tabVC.selectedIndex = 1
           
        }
        state = .settings
    }
    
    func presentEnding() {
        
        guard state != .ending else { return }
        let endingVC = createEndingVC()
        window?.rootViewController = endingVC
        state = .ending
 }
    
}




enum AppCoordinatorState {
    
    case login
    case home
    case settings
    case ending
    case storie
    
    var isTab: Bool {
        
        self == .home || self == .settings
        
    }
    
}

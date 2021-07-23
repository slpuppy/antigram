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
    
    func presentSettings()
    
}

class AppCoordinator {
    
    weak var window: UIWindow?
    var state: AppCoordinatorState?
    
    init(window: UIWindow) {
        
        self.window = window
        
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
        configVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
        
        tabController.viewControllers = [homeVC, configVC]
        tabController.tabBar.tintColor = .black
        return tabController
  }
    
}


extension AppCoordinator: AppCoordinatorDelegate {
   
    func presentLogIn() {
        guard state != .login else { return }
        let loginVC = createLogInVC()
        window?.rootViewController = loginVC
 }
    
    func presentHome() {
       
        print("QUALQUER COISA 1")
        guard state != .home else { return }
        print("QUALQUER COISA DPS DO GUARD")
        
        if let state = state, state.isTab {
            
            print("QUALQUER COISA DENTRO DO IF LET")
            guard let tabVC = window?.rootViewController as? UITabBarController else { return }
            
            tabVC.selectedIndex = 0
            
        } else {
            
            print("QUALQUER COISA DENTRO DO ELSE")
            let tabVC = createTabBarVC()
            window?.rootViewController = tabVC
            
        }
        
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
    }
    
}


enum AppCoordinatorState {
    
    case login
    case home
    case settings
    
    var isTab: Bool {
        
        self == .home || self == .settings
        
    }
    
}

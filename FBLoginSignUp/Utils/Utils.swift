//
//  Utils.swift
//  FBLoginSignUp
//
//  Created by Richa Srivastava on 20/06/2025.
//
import UIKit

final class Utils {
    
    static let shared = Utils()
    private init() {}
    
    @MainActor
    func getTopViewController(controller: UIViewController? = nil) -> UIViewController? {
        
        let controller = controller ??  UIApplication.shared.keyWindow?.rootViewController
        
        if let nav = controller as? UINavigationController {
            return getTopViewController(controller: nav.visibleViewController)
            
        } else if let tab = controller as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(controller: selected)
            
        } else if let presented = controller?.presentedViewController {
            return getTopViewController(controller: presented)
        }
        return controller
    }
}

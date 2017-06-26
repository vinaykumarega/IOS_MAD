//
//  AppStatusBarController.swift
//  Music-iOS
//
//  
//

import Foundation
import Material

class AppStatusBarController: StatusBarController {
    open override func prepare() {
        super.prepare()
        
        prepareStatusBar()
    }
}

extension AppStatusBarController {
    fileprivate func prepareStatusBar() {
        statusBarStyle = .lightContent
    }
}

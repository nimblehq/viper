//
//  ReposRouter.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import UIKit

final class ReposRouter {
    weak var view: ReposViewController?
}

// MARK: - VIPER
extension ReposRouter: Router {}

// MARK: - Interface
extension ReposRouter: ReposRouterInput {
    func detail() {
        // TODOs: Move to Another Module
    }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "viper".uppercased(), message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        view?.present(alert, animated: true, completion: nil)
    }
}

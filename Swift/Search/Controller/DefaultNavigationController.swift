//
//  DefaultNavigationController.swift
//  Search
//
//  Created by John Lima on 19/04/17.
//  Copyright © 2017 John Lima. All rights reserved.
//

import UIKit

class DefaultNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func updateUI() {
        navigationBar.barTintColor = .purple
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor.white]
    }
}

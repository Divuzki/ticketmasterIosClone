//
//  BrandedNavigationController.swift
//  TMSDKDemoIntegration
//
//  Created by Jonathan Backer on 7/5/23.
//

import UIKit

class BrandedNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use mock theme
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .systemBlue
        barAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.standardAppearance = barAppearance
        navigationBar.scrollEdgeAppearance = barAppearance
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .systemBlue
    }
}

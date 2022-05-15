//
//  BaseViewController.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setHierarchy()
        setNavigation()
        setStyle()
        setTargets()
    }
    
    // MARK: - Functions
    func setHierarchy() { }
    func setNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
    func setStyle() { }
    func setTargets() { }
}

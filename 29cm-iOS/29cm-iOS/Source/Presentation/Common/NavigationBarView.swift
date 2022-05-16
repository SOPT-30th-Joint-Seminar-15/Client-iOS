//
//  NavigationBarView.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/16.
//

import UIKit

protocol NavigationBarViewDelegate {
    func dismissButtonClicked()
}

class NavigationBarView: UIView, Reusable {

    // MARK: - Properties
    var delegate: NavigationBarViewDelegate?
    
    // MARK: - Initialization
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }
    
    // MARK: - Functions
    private func commonInit() {
        guard let navigationBarView = UINib(nibName: NavigationBarView.reuseIdentifier, bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        navigationBarView.frame = self.bounds
        addSubview(navigationBarView)
    }
    
    // MARK: - @IBAction Properties
    @IBAction func backButtonClicked(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.dismissButtonClicked()
        }
    }
}

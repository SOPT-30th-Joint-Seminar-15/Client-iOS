//
//  SelectButtonView.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/17.
//

import UIKit

protocol SelectButtonViewDelegate {
    func selectButtonClicked()
}

class SelectButtonView: UIView, Reusable {

    // MARK: - Properties
    var delegate: SelectButtonViewDelegate?
    
    // MARK: - Initialization
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Functions
    private func commonInit() {
        guard let selectButtonView = UINib(nibName: SelectButtonView.reuseIdentifier, bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        selectButtonView.frame = self.bounds
        addSubview(selectButtonView)
    }
    
    // MARK: - @IBAction Properties
    @IBAction func touchUpToSelectButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.selectButtonClicked()
        }
    }
}

//
//  UITextField+.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit.UITextField

extension UITextField {
    // 텍필 왼쪽 여백 주는 메서드
    func setLeftPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    // 텍필 오른쪽 여백 주는 메서드
    func setRightPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

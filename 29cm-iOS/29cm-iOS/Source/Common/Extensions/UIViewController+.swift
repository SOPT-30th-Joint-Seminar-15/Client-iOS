//
//  UIViewController+.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit

extension UIViewController {
    // 배경을 터치했을 때 키보드를 내려주는 함수입니다
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() { view.endEditing(true) }
}

extension UIViewController: Reusable {}

//
//  CALayer+.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit

extension CALayer {
    /*
     뷰의 그림자를 만들어주는 함수입니다
     사용법: view.layer.applyShadow(color: .black, alpha: 0.1, x: 1, y: 1, blur: 7, spread: 0)
     */
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0) {
            masksToBounds = false
            shadowColor = color.cgColor
            shadowOpacity = alpha
            shadowOffset = CGSize(width: x, height: y)
            shadowRadius = blur / 2.0
            
            if spread == 0 { shadowPath = nil }
            else {
                let dx = -spread
                let rect = bounds.insetBy(dx: dx, dy: dx)
                shadowPath = UIBezierPath(rect: rect).cgPath
            }
        }
}

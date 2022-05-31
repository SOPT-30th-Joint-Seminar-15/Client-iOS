//
//  UIView+.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit.UIView

extension UIView {
    // 테두리 둥글게
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    // 테두리 둥글게 + 특정 색깔로
    func makeRoundedWithBorder(radius: CGFloat, borderColor: CGColor, borderWidth: CGFloat = 1) {
        makeRounded(radius: radius)
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
    
    // 특정 테두리만 둥글게
    func makeRoundedSpecificCorner(corners: UIRectCorner, cornerRadius: Double) {
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        
        self.layer.mask = shapeLayer
    }
    
    // 테두리 폭
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    // 테두리 색깔
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

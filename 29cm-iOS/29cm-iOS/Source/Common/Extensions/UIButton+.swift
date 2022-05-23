//
//  UIButton+.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/05/24.
//

import UIKit

extension UIButton {
    @IBInspectable var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
        }
    
    @IBInspectable var borderColor: UIColor? {
            get {
                return UIColor(cgColor: layer.borderColor!)
            }
            set {
                layer.borderColor = newValue?.cgColor
            }
        }

}

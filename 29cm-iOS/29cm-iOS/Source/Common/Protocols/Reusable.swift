//
//  Reusable.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import Foundation
import UIKit
// identifier의 반복되는 선언을 덜어주는 프로토콜입니다
protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

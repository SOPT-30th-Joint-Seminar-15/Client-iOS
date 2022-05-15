//
//  Adjusted+.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit

/*
 기기대응을 위한 Extension입니다
 
 - 아이폰 13 mini의 screen 너비를 기준으로, 현재 기기의 너비 수치에 비례하는 값을 return
 - 사용 예시 → (size: 20.adjusted)
 */

extension CGFloat {
    var adjustedWidth: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 375
        return self * ratio
    }
    
    var adjustedHeight: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.height / 812
        return self * ratio
    }
}

extension Double {
    var adjustedWidth: Double {
        let ratio: Double = Double(UIScreen.main.bounds.width / 375)
        return self * ratio
    }
    
    var adjustedHeight: Double {
        let ratio: Double = Double(UIScreen.main.bounds.height / 812)
        return self * ratio
    }
}

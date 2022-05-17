//
//  Font.swift
//  29cm-iOS
//
//  Created by 김하늘 on 2022/05/17.
//

import UIKit.UIFont

extension Const {
    enum Font: String {
        case NotoSansKRBlack = "NotoSansKR-Black"
        case NotoSansKRBold = "NotoSansKR-Bold"
        case NotoSansKRLight = "NotoSansKR-Light"
        case NotoSansKRMedium = "NotoSansKR-Medium"
        case NotoSansKRRegular = "NotoSansKR-Regular"
        case NotoSansKRThin = "NotoSansKR-Thin"
        
        case SpoqaHanSansNeoBold = "SpoqaHanSansNeo-Bold"
        case SpoqaHanSansNeoLight = "SpoqaHanSansNeo-Light"
        case SpoqaHanSansNeoMedium = "SpoqaHanSansNeo-Medium"
        case SpoqaHanSansNeoRegular = "SpoqaHanSansNeo-Regular"
        case SpoqaHanSansNeoThin = "SpoqaHanSansNeo-Thin"
        
        case QuicksandBold = "Quicksand-Bold"
        case QuicksandLight = "Quicksand-Light"
        case QuicksandMedium = "Quicksand-Medium"
        case QuicksandRegular = "Quicksand-Regular"
        case QuicksandSemiBold = "Quicksand-SemiBold"
        
        var name: String {
            return self.rawValue
        }
    }
}

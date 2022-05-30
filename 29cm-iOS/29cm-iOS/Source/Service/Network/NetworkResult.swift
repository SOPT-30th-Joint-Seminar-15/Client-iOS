//
//  NetworkResult.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/30.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}

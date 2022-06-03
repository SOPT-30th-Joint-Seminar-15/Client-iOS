//
//  InquiryCreateDataService.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/30.
//

import Foundation

import Alamofire

struct InquiryCreateDataService {
    static let shared = InquiryCreateDataService()

    func inquiryCreate(userId: String,
                       email: String,
                       inquiryCategory: String,
                       orderNum: String,
                       title: String,
                       content: String,
                       isSubscribed: Bool,
                       completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Const.APIConstants.inquiryCreate
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        let body: Parameters = [
            "userId": userId,
            "email": email,
            "inquiryCategory": inquiryCategory,
            "orderNum": orderNum,
            "title": title,
            "content": content,
            "isSubscribed": isSubscribed
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode,
                      let value = response.value
                else { return }
                print("응답 상태!!!!", statusCode)
                let networkResult = self.judgeStatus(by: statusCode, in: value)
                dump(networkResult)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}

extension InquiryCreateDataService {
    private func judgeStatus(by statusCode: Int, in data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            return isValidData(in: data)
        case 400:
            return isUsedPathErr(in: data)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func isValidData(in data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(InquiryCreateResponse.self, from: data)
        else { return .pathErr }
        return .success(decodedData)
    }
    
    private func isUsedPathErr(in data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(InquiryCreateResponse.self, from: data) else { return .pathErr }
        return .requestErr(decodedData)
    }
}

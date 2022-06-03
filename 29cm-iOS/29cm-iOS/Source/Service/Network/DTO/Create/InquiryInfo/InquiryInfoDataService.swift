//
//  InquiryInfoDataService.swift
//  29cm-iOS
//
//  Created by 김하늘 on 2022/06/03.
//

import Foundation

import Alamofire

struct InquiryInfoDataService {
    static let shared = InquiryInfoDataService()
    
    func inquiryInfo(orderNum: String,
                     completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Const.APIConstants.inquiryInfo + orderNum
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode,
                      let value = response.value
                else { return }
                let networkResult = self.judgeStatus(by: statusCode, in: value)
                dump(networkResult)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}

extension InquiryInfoDataService {
    private func judgeStatus(by statusCode: Int, in data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200...299:
            return isValidData(in: data)
        case 400...499:
            return .pathErr
        case 500...599:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func isValidData(in data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(InquiryInfoResponse.self, from: data)
        else { return .pathErr }
        return .success(decodedData)
    }
    
    private func isUsedPathErr(in data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(InquiryInfoResponse.self, from: data)
        else { return .pathErr }
        return .requestErr(decodedData)
    }
}

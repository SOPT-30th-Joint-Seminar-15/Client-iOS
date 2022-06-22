//
//  InquiryReadDataService.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/06/03.
//
import Foundation

import Alamofire

struct InquiryReadDataService {
    static let shared = InquiryReadDataService()

    func inquiryRead(userId: String,
                       completion: @escaping (NetworkResult<Any>) -> Void) {
        Const.APIConstants.userId = userId
        let url = Const.APIConstants.inquiryRead
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
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
                print("응답 상태!!!!", statusCode)
                let networkResult = self.judgeStatus(by: statusCode, in: value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}

extension InquiryReadDataService {
    private func judgeStatus(by statusCode: Int, in data: Data) -> NetworkResult<Any> {
    
        switch statusCode {
        case ..<300:
            return isValidData(in: data)
        case 400..<500:
            return  isUsedPathErr(in: data)
        case 500..<600:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    
    private func isValidData(in data: Data) -> NetworkResult<Any> {
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(InquiryDeleteResponse.self, from: data)
            else { return .pathErr }
            return .success(decodedData)
        }

        private func isUsedPathErr(in data: Data) -> NetworkResult<Any> {
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(InquiryDeleteResponse.self, from: data)
            else { return .pathErr }
            return .requestErr(decodedData)
        }
}

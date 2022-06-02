//
//  InquiryDeleteDataService.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/06/03.
//

import Foundation

import Alamofire

struct InquiryDeleteDataService {
    static let shared = InquiryDeleteDataService()

    func inquiryDelete(inquiryId: String,
                       completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Const.APIConstants.inquiryDelete
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "inquiryId": inquiryId
        ]
        
        let dataRequest = AF.request(url,
                                     method: .delete,
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

extension InquiryDeleteDataService {
    private func judgeStatus(by statusCode: Int, in data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case ..<300:
            return .success(data)
        case 400..<500:
            return .requestErr(data)
        case 500..<600:
            return .serverErr
        default:
            print("judgeStatus")
            return .networkFail
        }
    }
//
//    private func isValidData(in data: Data) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//        guard let decodedData = try? decoder.decode(InquiryReadData.self, from: data)
//        else { return .pathErr }
//        return .success(decodedData)
//    }
//
//    private func isUsedPathErr(in data: Data) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//        guard let decodedData = try? decoder.decode(InquiryReadData.self, from: data)
//        else { return .pathErr }
//        return .requestErr(decodedData)
//    }
}

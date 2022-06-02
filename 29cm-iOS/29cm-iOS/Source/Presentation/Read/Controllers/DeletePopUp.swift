//
//  DeletePopUp.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/05/25.
//

import UIKit

final class DeletePopUp: UIViewController {
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first, touch.view == self.view {
            dismiss(animated: true)
        }
    }
    
    // MARK: - @IBAction Properties
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func confirmButtonClicked(_ sender: UIButton) {
        deletePost()
        dismiss(animated: true)
        
    }
}

extension DeletePopUp {
    func deletePost() {
        InquiryDeleteDataService.shared.inquiryDelete(
            
            //TODO: 글 id 가져와서 넣기
            inquiryId: "628f4cbecc247601f5bcdc50") { response in
            switch response {
            case .success(let data):
                guard let data = data as? InquiryDeleteResponse else { return }
                print(data)
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}

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
        dismiss(animated: true)
        
    }
}

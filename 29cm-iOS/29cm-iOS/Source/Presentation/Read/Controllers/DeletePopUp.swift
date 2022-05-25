//
//  DeletePopUp.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/05/25.
//

import UIKit

class DeletePopUp: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first, touch.view == self.view {
            dismiss(animated: true)
        }
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func confirmButtonClicked(_ sender: Any) {
        dismiss(animated: true)
        
    }
}

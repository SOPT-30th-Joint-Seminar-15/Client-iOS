//
//  InputCollectionViewCell.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/20.
//

import UIKit

final class InputCollectionViewCell: UICollectionViewCell {
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var emailChangeButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var contentsEmptyLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setStyle()
    }
}

// MARK: - Extensions
extension InputCollectionViewCell {
    // TODO: - setStyle() → @IBInspectable 이용하는 것으로 변경
    private func setStyle() {
        titleTextField.setLeftPadding(amount: 5)
        [emailChangeButton, titleTextField, contentsTextView].forEach {
            $0?.makeRoundedWithBorder(radius: 0, borderColor: Const.Color.cmLineGrey!.cgColor)
        }
    }
}

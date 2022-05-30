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
    @IBOutlet weak var titleTextField: UITextField! {
        didSet {
            titleTextField.delegate = self
            titleTextField.setLeftPadding(amount: 5)
        }
    }
    @IBOutlet weak var contentsTextView: UITextView! {
        didSet {
            contentsTextView.delegate = self
            contentsTextView.textContainerInset = UIEdgeInsets(top: 14, left: 9, bottom: 0, right: 0)
        }
    }
    @IBOutlet weak var contentsEmptyLabel: UILabel!
    @IBOutlet weak var emailSendButton: UIButton!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func emailSendButtonDidTapped(_ sender: UIButton) {
        emailSendButton.isSelected ?
        emailSendButton.setImage(Const.Image.icnSelectboxOn, for: .selected) :
        emailSendButton.setImage(Const.Image.icnSelectboxOff, for: .normal)
        emailSendButton.isSelected.toggle()
    }
}

// MARK: - Extensions
extension InputCollectionViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension InputCollectionViewCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        contentsEmptyLabel.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { contentsEmptyLabel.isHidden = false }
    }
}

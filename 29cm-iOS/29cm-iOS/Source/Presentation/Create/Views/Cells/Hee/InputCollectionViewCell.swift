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
        didSet { titleTextField.delegate = self }
    }
    @IBOutlet weak var contentsTextView: UITextView! {
        didSet { contentsTextView.delegate = self }
    }
    @IBOutlet weak var contentsEmptyLabel: UILabel!
    @IBOutlet weak var emailSendButton: UIButton!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setStyle()
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
extension InputCollectionViewCell {
    // TODO: - setStyle() → @IBInspectable 이용하는 것으로 변경
    private func setStyle() {
        titleTextField.setLeftPadding(amount: 5)
        contentsTextView.textContainerInset = UIEdgeInsets(top: 14, left: 9, bottom: 0, right: 0)
        [emailChangeButton, titleTextField, contentsTextView].forEach {
            $0?.makeRoundedWithBorder(radius: 0, borderColor: Const.Color.cmLineGrey!.cgColor)
        }
    }
}

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

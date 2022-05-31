//
//  CheckListCollectionViewCell.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/19.
//

import UIKit

final class CheckListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    enum ButtonType: Int, CaseIterable {
        case purchase
        case others
    }
    
    // MARK: - @IBOutlet Properties
    @IBOutlet var checkButtons: [UIButton]! {
        didSet {
            for i in 0..<checkButtons.count {
                checkButtons[i].setImage(Const.Image.icnButtonOn, for: .selected)
            }
        }
    }
    @IBOutlet var purchaseButtons: [UIButton]!
    @IBOutlet weak var numberTextField: UITextField! {
        didSet { numberTextField.delegate = self }
    }
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var numberStackView: UIStackView!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func checkButtonDidTapped(_ sender: UIButton) {
        let index = sender.tag
        switch index {
        case ButtonType.purchase.rawValue:
            if !sender.isSelected {
                for i in 0..<purchaseButtons.count { checkButtons[i].isSelected = false }
                if purchaseButtons.contains(sender) { numberStackView.isHidden = false }
            } else { numberStackView.isHidden = true }
        case ButtonType.others.rawValue:
            if !sender.isSelected {
                for i in purchaseButtons.count..<checkButtons.count { checkButtons[i].isSelected = false }
                if checkButtons.contains(sender) { numberStackView.isHidden = true }
            } else { numberStackView.isHidden = false }
        default:
            numberStackView.isHidden = true
        }
        sender.isSelected.toggle()
    }
}

// MARK: - Extensions
extension CheckListCollectionViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

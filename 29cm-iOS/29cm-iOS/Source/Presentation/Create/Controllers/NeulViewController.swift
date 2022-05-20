//
//  NeulViewController.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit

final class NeulViewController: BaseViewController, UITextFieldDelegate {

    // MARK: - @IBOutlet Properties
    @IBOutlet weak var inquiryTitleTextField: UITextField!
    @IBOutlet weak var inquiryContentTextView: UITextView!
    @IBOutlet weak var inquiryNumberTextField: UITextField!
    @IBOutlet weak var inquiryNumberButton: UIButton!
    @IBOutlet weak var changeEmailButton: UIButton!
    @IBOutlet var allInquiryButtons: [UIButton]!
    @IBOutlet var allPurchaseButtons: [UIButton]!
    @IBOutlet weak var orderDetailView: UIView!
    @IBOutlet weak var orderDetailViewConst: NSLayoutConstraint!
    
    // MARK: - Properties
    let titleTextFieldPlaceHolder: String = "제목을 입력해주세요"
    let textViewPlaceHolder: String = "내용을 입력해주세요"
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func inquiryTypeButtonDidTapped(_ sender: UIButton) {
        if !sender.isSelected {
            for i in 0..<allInquiryButtons.count {
                allInquiryButtons[i].isSelected = false
            }
            if allPurchaseButtons.contains(sender) {
                orderDetailView.isHidden = false
                orderDetailViewConst.constant = 238.5
            }
            else {
                orderDetailView.isHidden = true
                orderDetailViewConst.constant = 0
            }
            sender.isSelected = true
        }
        else {
            sender.isSelected = false
            orderDetailView.isHidden = true
            orderDetailViewConst.constant = 0
            
        }
    }
    
    // MARK: - Functions
    func setUI() {
        
        self.hideKeyboardWhenTappedAround()
        
        if let inquiryTitleTextField = inquiryTitleTextField,
           let inquiryContentTextView = inquiryContentTextView,
           let changeEmailButton = changeEmailButton,
           let allInquiryButtons = allInquiryButtons,
           let orderDetailView = orderDetailView {
            
            inquiryTitleTextField.delegate = self
            inquiryContentTextView.delegate = self
            
            for i in 0..<allInquiryButtons.count {
                allInquiryButtons[i].setImage(Const.Image.icnButtonOff, for: .normal)
                allInquiryButtons[i].setImage(Const.Image.icnButtonOn, for: .selected)
            }
            
            orderDetailView.isHidden = true
            orderDetailViewConst.constant = 0
            
            setBorder(textField: inquiryTitleTextField)
            setBorder(textView: inquiryContentTextView)
            setBorder(button: changeEmailButton)
            inquiryTitleTextField.setLeftPadding(amount: 13)
            inquiryTitleTextField.setRightPadding(amount: 13)
            inquiryContentTextView.textContainerInset =  UIEdgeInsets(top: 14, left: 9, bottom: 0, right: 0)
            
            // 텍스트뷰 placeholder
            inquiryTitleTextField.attributedPlaceholder = NSAttributedString(string: titleTextFieldPlaceHolder, attributes: [NSAttributedString.Key.foregroundColor : Const.Color.cmGrey02 ?? UIColor.lightGray])
            inquiryContentTextView.text = textViewPlaceHolder
            inquiryContentTextView.textColor = Const.Color.cmGrey02
            
        }
            
    
        if let inquiryNumberButton = inquiryNumberButton,
           let inquiryNumberTextField = inquiryNumberTextField {
            
            inquiryNumberTextField.delegate = self
            
            setBorder(button: inquiryNumberButton)
            setBorder(textField: inquiryNumberTextField)
            inquiryNumberTextField.setLeftPadding(amount: 13)
            inquiryNumberTextField.setRightPadding(amount: 13)
        }
        
        func setBorder(button: UIButton) {
            button.layer.borderWidth = 1
            button.layer.borderColor = Const.Color.cmBoxGrey?.cgColor
        }
        func setBorder(textField: UITextField) {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = Const.Color.cmBoxGrey?.cgColor
        }
        func setBorder(textView: UITextView) {
            textView.layer.borderWidth = 1
            textView.layer.borderColor = Const.Color.cmBoxGrey?.cgColor
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Extensions
extension NeulViewController: UITextViewDelegate  {
    
    // 텍스트뷰 placeholder
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor  = Const.Color.cmBlack02
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = Const.Color.cmGrey02
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}

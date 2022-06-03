//
//  NeulViewController.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit

import Alamofire

final class NeulViewController: BaseViewController, UITextFieldDelegate {

    // MARK: - @IBOutlet Properties
    @IBOutlet weak var inquiryTitleTextField: UITextField!
    @IBOutlet weak var inquiryContentTextView: UITextView!
    @IBOutlet weak var inquiryNumberTextField: UITextField!
    @IBOutlet weak var inquiryNumberButton: UIButton!
    @IBOutlet weak var changeEmailButton: UIButton!
    @IBOutlet var inquiryButtons: [UIButton]!
    @IBOutlet var purchaseButtons: [UIButton]!
    @IBOutlet weak var orderDetailView: UIView!
    @IBOutlet weak var orderDetailViewConst: NSLayoutConstraint!
    @IBOutlet weak var allowEmailButton: UIButton!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var payMethodLabel: UILabel!
    
    // MARK: - Properties
    let titleTextFieldPlaceHolder: String = "제목을 입력해주세요"
    let textViewPlaceHolder: String = "내용을 입력해주세요"
    var selectedInquiryCategory: String = ""
    let popUpStoryboard = UIStoryboard.init(name: "CompletionPopUpView", bundle: nil)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func inquiryTypeButtonDidTapped(_ sender: UIButton) {
        if !sender.isSelected {
            for i in 0..<inquiryButtons.count {
                inquiryButtons[i].isSelected = false
            }
            if purchaseButtons.contains(sender) {
                orderDetailView.isHidden = false
                orderDetailViewConst.constant = 238.5.adjustedHeight
            }
            else {
                orderDetailView.isHidden = true
                orderDetailViewConst.constant = 0
            }
            sender.isSelected = true
            selectedInquiryCategory = sender.titleLabel?.text ?? ""
            print(selectedInquiryCategory)
        }
        else {
            sender.isSelected = false
            orderDetailView.isHidden = true
            orderDetailViewConst.constant = 0
            selectedInquiryCategory = ""
        }
    }
    @IBAction func allowEmailButtonTapped(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = true
        }
        else {
            sender.isSelected = false
        }
    }
    @IBAction func checkInquiryButtonTapped(_ sender: UIButton) {
        fetchInquiryInfo()
    }
    
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        guard let inquiryTitle = inquiryTitleTextField.text,
              let inquiryContent = inquiryContentTextView.text else { return }
        print("----------------------------")
        print(Const.UserID.userE9)
        print("soryeongk@test.com")
        print(selectedInquiryCategory)
        print(Const.OrderNum.orderAC)
        print(inquiryTitle)
        print(inquiryContent)
        print(allowEmailButton.isSelected)
        print("----------------------------")
        InquiryCreateDataService.shared.inquiryCreate(
            userId: Const.UserID.userE9,
            email: "haneul@test.com",
            inquiryCategory: selectedInquiryCategory,
            orderNum: Const.OrderNum.orderAC,
            title: inquiryTitle,
            content: inquiryContent,
            isSubscribed: allowEmailButton.isSelected) { response in
                switch response {
                case .success(let data):
                    guard let data = data as? InquiryCreateResponse,
                          let completionPopUp = self.popUpStoryboard.instantiateViewController(withIdentifier: "CompletionPopUpViewController") as? CompletionPopUpViewController else { return }
                    print("success")
                    completionPopUp.modalPresentationStyle = .overFullScreen
                    self.present(completionPopUp, animated: true)
                case .requestErr(let error):
                    print(error)
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
                
            }
    }
    
    // MARK: - Functions
    func setUI() {
        
        self.hideKeyboardWhenTappedAround()
        
        if let inquiryTitleTextField = inquiryTitleTextField,
           let inquiryContentTextView = inquiryContentTextView,
           let changeEmailButton = changeEmailButton,
           let allInquiryButtons = inquiryButtons,
           let orderDetailView = orderDetailView,
           let allowEmailButton = allowEmailButton {
            
            inquiryTitleTextField.delegate = self
            inquiryContentTextView.delegate = self
            
            for i in 0..<allInquiryButtons.count {
                allInquiryButtons[i].setImage(Const.Image.icnButtonOff, for: .normal)
                allInquiryButtons[i].setImage(Const.Image.icnButtonOn, for: .selected)
            }
            allowEmailButton.setImage(Const.Image.icnSelectboxOn, for: .selected)
            allowEmailButton.setImage(Const.Image.icnSelectboxOff, for: .normal)
            
            orderDetailView.isHidden = true
            orderDetailViewConst.constant = 0
            
            setBorder(view: inquiryTitleTextField)
            setBorder(view: inquiryContentTextView)
            setBorder(view: changeEmailButton)
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
            
            setBorder(view: inquiryNumberButton)
            setBorder(view: inquiryNumberTextField)
            inquiryNumberTextField.setLeftPadding(amount: 13)
            inquiryNumberTextField.setRightPadding(amount: 13)
        }
        
        func setBorder(view: UIView) {
            view.makeRoundedWithBorder(radius: 0, borderColor: Const.Color.cmBoxGrey!.cgColor)
        }
    }
    func fetchInquiryInfo() {
        guard let inquiryNumber = inquiryNumberTextField.text else { return }
        InquiryInfoDataService.shared.inquiryInfo(orderNum: inquiryNumber) { response in
            switch response {
            case .success(let data):
                guard let data = data as? InquiryInfoResponse,
                      let inquiryData = data.data?.first
                else { return }
                // 상품명
                self.productNameLabel.text = inquiryData.productName
                
                // 결제방법
                self.payMethodLabel.text = inquiryData.payMethod
         
                // 주문일자
                let dateFormatter = DateFormatter()
                let simpleDateFormatter = DateFormatter()
                
                dateFormatter.locale = Locale(identifier: "ko_KR")
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                
                guard let date = dateFormatter.date(from: inquiryData.orderDate) else { return }
                simpleDateFormatter.dateFormat = "yyyy.MM.dd"

                self.orderDateLabel.text = simpleDateFormatter.string(from: date)
                print("success")
                
            case .requestErr(let error):
                print(error)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
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

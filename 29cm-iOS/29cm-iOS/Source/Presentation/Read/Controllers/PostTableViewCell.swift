//
//  PostListTableViewCell.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/05/19.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var delegate : PostTableViewCellDelegate?
    var inquiryId=""
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var postEntireStackView: UIStackView!
    @IBOutlet weak var postContentView: UIView!
    
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var inquiryCategoryLabel: UILabel!
    @IBOutlet weak var isAnsweredLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    //MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        postContentView.isHidden.toggle()
        delegate?.tableViewCellReload()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        delegate?.deleteButtonClicked(inquiryId: inquiryId)
    }
    
    
    func setData(_ data : InquiryReadData){
        createdAtLabel.text = data.createdAt
        inquiryCategoryLabel.text = data.inquiryCategory
        isAnsweredLabel.text = data.isAnswered ? "YES" : "NO"
        questionLabel.text = data.question
        answerLabel.text = data.answer
        inquiryId = data.inquiryId
        
    }
}

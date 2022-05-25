//
//  PostListTableViewCell.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/05/19.
//

import UIKit

// MARK: - Protocols
protocol PostTableViewCellDelegate : AnyObject{
    func deleteButtonClicked()
}

final class PostTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var delegate : PostTableViewCellDelegate?
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var postContentView: UIView!
    
    //MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        postContentView.isHidden.toggle()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func deleteButtonClicked(_ sender: Any) {
        delegate?.deleteButtonClicked()
    }
}

//
//  PostListTableViewCell.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/05/19.
//

import UIKit

protocol PostTableViewCellDelegate : AnyObject{
    func deleteButtonClicked()
}

final class PostTableViewCell: UITableViewCell {
    
    var delegate : PostTableViewCellDelegate?
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var postContentView: UIView!
    
    //MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }  
    @IBAction func deleteButtonClicked(_ sender: Any) {
        print("Clicked")
        delegate?.deleteButtonClicked()
    }
}

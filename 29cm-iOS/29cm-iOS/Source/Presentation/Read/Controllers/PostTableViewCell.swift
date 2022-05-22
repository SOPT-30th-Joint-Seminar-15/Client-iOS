//
//  PostListTableViewCell.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/05/19.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    static let identifier = "PostTableViewCell"
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var postContentView: UIView!
    
    //MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }  
}

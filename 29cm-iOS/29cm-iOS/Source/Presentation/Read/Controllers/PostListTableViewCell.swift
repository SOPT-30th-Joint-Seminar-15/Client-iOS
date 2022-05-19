//
//  PostListTableViewCell.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/05/19.
//

import UIKit

class PostListTableViewCell: UITableViewCell {

    @IBOutlet weak var deleteButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

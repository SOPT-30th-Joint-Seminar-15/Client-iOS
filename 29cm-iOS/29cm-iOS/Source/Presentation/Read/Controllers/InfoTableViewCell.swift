//
//  TableViewInfoCell.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/05/19.
//

import UIKit

// MARK: - Protocols
protocol InfoTableViewCellDelegate : AnyObject{
    func createPostButtonClicked()
}

final class InfoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var delegate : InfoTableViewCellDelegate?

    //MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func createPostButtonClicked(_ sender: Any) {
        delegate?.createPostButtonClicked()
    }
    
}

//
//  CheckListCollectionViewCell.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/19.
//

import UIKit

final class CheckListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var numberButton: UIButton!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setStyle()
    }
}

// MARK: - Extensions
extension CheckListCollectionViewCell {
    private func setStyle() {
        [numberTextField, numberButton].forEach { $0?.makeRoundedWithBorder(radius: 0, borderColor: Const.Color.cmBoxGrey!.cgColor) }
    }
}

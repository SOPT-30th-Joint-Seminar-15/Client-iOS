//
//  File.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/05/30.
//

import Foundation

protocol PostTableViewCellDelegate : AnyObject{
    func deleteButtonClicked()
    func tableViewCellReload()
}

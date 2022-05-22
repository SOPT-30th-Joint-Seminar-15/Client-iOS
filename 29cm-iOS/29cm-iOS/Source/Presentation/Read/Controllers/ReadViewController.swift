//
//  ReadViewController.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit

final class ReadViewController: BaseViewController {

    @IBOutlet weak var navigationBar: NavigationBarView!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
    }
    
    private func registerNib() {
            let infoNib = UINib(nibName: InfoTableViewCell.identifier, bundle: nil)
            tableView.register(infoNib, forCellReuseIdentifier: InfoTableViewCell.identifier)
            
            let postNib = UINib(nibName: PostTableViewCell.identifier, bundle: nil)
            tableView.register(postNib, forCellReuseIdentifier: PostTableViewCell.identifier)
            
            tableView.delegate = self
            tableView.dataSource = self
        tableView.estimatedRowHeight = 108
        tableView.rowHeight = UITableView.automaticDimension
        }

}

extension ReadViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = UIScreen.main.bounds.width

        var cellHeight: CGFloat
        switch indexPath.section {
        case 0:
            cellHeight = width * (292/375)
        case 1:
            cellHeight = width * (108/375)
        default:
            cellHeight = 0
        }
        return cellHeight

    }
}

extension ReadViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? InfoTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        case 1:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
                        
            return cell
        default:
            return UITableViewCell()
            
        }
        
    }
}

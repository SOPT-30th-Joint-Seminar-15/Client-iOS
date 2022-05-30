//
//  ReadViewController.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit

final class ReadViewController: BaseViewController {

    // MARK: - @IBOutlet Properties
    @IBOutlet weak var navigationBar: NavigationBarView!
    @IBOutlet weak var readTableView: UITableView!
//    @IBOutlet weak var paginationView: UIView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
    }
    
    // MARK: - Functions
    private func registerNib() {
            let infoNib = UINib(nibName: InfoTableViewCell.reuseIdentifier, bundle: nil)
        readTableView.register(infoNib, forCellReuseIdentifier: InfoTableViewCell.reuseIdentifier)
            
            let postNib = UINib(nibName: PostTableViewCell.reuseIdentifier, bundle: nil)
        readTableView.register(postNib, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        
        let pageNib = UINib(nibName: PagingTableViewCell.reuseIdentifier, bundle: nil)
    readTableView.register(pageNib, forCellReuseIdentifier: PagingTableViewCell.reuseIdentifier)
            
        readTableView.delegate = self
        readTableView.dataSource = self
        readTableView.estimatedRowHeight = 108
        readTableView.rowHeight = UITableView.automaticDimension
        }
}

// MARK: - Extensions
extension ReadViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight: CGFloat
        switch indexPath.section {
        case 0:
            cellHeight = 292.adjustedHeight
        case 1:
            cellHeight = 108.adjustedHeight
//            108.adjustedHeight
//            UITableView.automaticDimension
        case 2 :
            cellHeight = 25.adjustedHeight
        default:
            cellHeight = 0
        }
        return cellHeight
    }
}

extension ReadViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.reuseIdentifier, for: indexPath) as? InfoTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate=self
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate=self
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PagingTableViewCell.reuseIdentifier, for: indexPath) as? PagingTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

extension ReadViewController :PostTableViewCellDelegate {
    func deleteButtonClicked() {
        guard let popUp = UIStoryboard(name: "DeletePopUp", bundle: nil).instantiateViewController(withIdentifier: DeletePopUp.reuseIdentifier) as? DeletePopUp else { return }
        popUp.modalTransitionStyle = .crossDissolve
        popUp.modalPresentationStyle = .overFullScreen
        self.present(popUp,animated: true)
    }
}

extension ReadViewController :InfoTableViewCellDelegate {
    func createPostButtonClicked() {
        guard let readView = UIStoryboard(name: "NeulView", bundle: nil).instantiateViewController(withIdentifier: NeulViewController.reuseIdentifier) as? NeulViewController else { return }
        self.navigationController?.pushViewController(readView, animated: true)
    }
}

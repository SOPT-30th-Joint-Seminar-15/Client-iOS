//
//  ReadViewController.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit

class ReadViewController: BaseViewController {

    // MARK: - @IBOutlet Properties
    @IBOutlet weak var navigationBar: NavigationBarView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
    }
    
    // MARK: - Functions
    private func registerNib() {
            let infoNib = UINib(nibName: InfoTableViewCell.reuseIdentifier, bundle: nil)
            tableView.register(infoNib, forCellReuseIdentifier: InfoTableViewCell.reuseIdentifier)
            
            let postNib = UINib(nibName: PostTableViewCell.reuseIdentifier, bundle: nil)
            tableView.register(postNib, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
            
            tableView.delegate = self
            tableView.dataSource = self
        tableView.estimatedRowHeight = 108
        tableView.rowHeight = UITableView.automaticDimension
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.reuseIdentifier, for: indexPath) as? InfoTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        case 1:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate=self
            return cell
        default:
            return UITableViewCell()
            
        }
        
    }
}

extension ReadViewController :PostTableViewCellDelegate {
    func deleteButtonClicked() {
        print("Clicked2")
        guard let popUp = storyboard?.instantiateViewController(withIdentifier: "DeletePopUp") as? DeletePopUp else { return }
        popUp.modalTransitionStyle = .crossDissolve
        popUp.modalPresentationStyle = .overFullScreen
        self.present(popUp,animated: true)
    }
}


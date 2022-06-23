//
//  ReadViewController.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit

final class ReadViewController: BaseViewController {

    // MARK: - Properties
    var inquiryList: [InquiryReadData] = []
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var navigationBar: NavigationBarView!
    @IBOutlet weak var readTableView: UITableView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        getInquiryData()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(postDeletedNotiReceived),
                                               name: NSNotification.Name("Inquiry Deleted"),
                                               object: nil)
    }
    
    // MARK: - Functions
    @objc func postDeletedNotiReceived(notification: NSNotification) {
        if let inquiryId = notification.userInfo?["inquiryId"] as? String
        {
            print("inquiryId",inquiryId)
            getInquiryData()
            self.readTableView.reloadData()
        }
    }
    
    private func registerNib() {
        let infoNib = UINib(nibName: InfoTableViewCell.reuseIdentifier, bundle: nil)
        readTableView.register(infoNib, forCellReuseIdentifier: InfoTableViewCell.reuseIdentifier)
            
        let postNib = UINib(nibName: PostTableViewCell.reuseIdentifier, bundle: nil)
        readTableView.register(postNib, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        
        let pageNib = UINib(nibName: PagingTableViewCell.reuseIdentifier, bundle: nil)
        readTableView.register(pageNib, forCellReuseIdentifier: PagingTableViewCell.reuseIdentifier)
            
        readTableView.delegate = self
        readTableView.dataSource = self
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
            cellHeight = UITableView.automaticDimension
        case 2 :
            cellHeight = 93.adjustedHeight
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
            return inquiryList.count
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
            cell.setData(inquiryList[indexPath.row])
            cell.index=indexPath.row
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
    func tableViewCellReload() {
        self.readTableView.performBatchUpdates(nil)
    }
    
    func deleteButtonClicked(inquiryId: String,index:Int) {
        guard let popUp = UIStoryboard(name: "DeletePopUp", bundle: nil).instantiateViewController(withIdentifier: DeletePopUp.reuseIdentifier) as? DeletePopUp else { return }
        popUp.inquiryId=inquiryId
        popUp.cellIndex=index
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

extension ReadViewController {
    func getInquiryData() {
        InquiryReadDataService.shared.inquiryRead(
            userId: "628f2a4174995ed500bc18e9") { response in
            switch response {
            case .success(let data):
                guard let data = data as? InquiryReadResponse else { return }
                if let data = data.data {
                    self.inquiryList = data
                    self.readTableView.reloadData()
                }
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}

//
//  HeeViewController.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/15.
//

import UIKit

final class HeeViewController: BaseViewController {
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var navigationBar: NavigationBarView!
    @IBOutlet weak var createCollectionViewCell: UICollectionView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        assignDelegation()
        registerNib()
    }
    
    // MARK: - Functions
    private func assignDelegation() {
        createCollectionViewCell.delegate = self
        createCollectionViewCell.dataSource = self
    }
    
    private func registerNib() {
        createCollectionViewCell.register(
            UINib(nibName: CheckListCollectionViewCell.reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: CheckListCollectionViewCell.reuseIdentifier
        )
        createCollectionViewCell.register(
            UINib(nibName: InputCollectionViewCell.reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: InputCollectionViewCell.reuseIdentifier
        )
    }
}

// MARK: - Extensions
extension HeeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: 375.adjustedWidth, height: 718.adjustedHeight)
        case 1:
            return CGSize(width: 375.adjustedWidth, height: 646.adjustedHeight)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}

extension HeeViewController: UICollectionViewDelegate { }

extension HeeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let checkCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CheckListCollectionViewCell.reuseIdentifier, for: indexPath) as? CheckListCollectionViewCell
            else { return UICollectionViewCell() }
            return checkCell
        case 1:
            guard let inputCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: InputCollectionViewCell.reuseIdentifier, for: indexPath) as? InputCollectionViewCell
            else { return UICollectionViewCell() }
            return inputCell
        default:
            return UICollectionViewCell()
        }
    }
}

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
    @IBOutlet weak var createCollectionView: UICollectionView! {
        didSet {
            createCollectionView.delegate = self
            createCollectionView.dataSource = self
        }
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNib()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        guard let completionPopUp = self.storyboard?.instantiateViewController(withIdentifier: CompletionPopUpViewController.reuseIdentifier) as? CompletionPopUpViewController
        else { return }
        completionPopUp.modalTransitionStyle = .crossDissolve
        completionPopUp.modalPresentationStyle = .overFullScreen
        self.present(completionPopUp, animated: true) {
            // TODO: - 서버통신 시 처리
        }
    }
}

// MARK: - Extensions
extension HeeViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let touch = touches.first, touch.view == self.view { view.endEditing(true) }
    }
    
    private func registerNib() {
        createCollectionView.register(
            UINib(nibName: CheckListCollectionViewCell.reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: CheckListCollectionViewCell.reuseIdentifier
        )
        createCollectionView.register(
            UINib(nibName: InputCollectionViewCell.reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: InputCollectionViewCell.reuseIdentifier
        )
    }
}
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

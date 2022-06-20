//
//  CompletionPopUpViewController.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/24.
//

import UIKit

final class CompletionPopUpViewController: BaseViewController {

    // MARK: - @IBOutlet Properties
    @IBOutlet weak var completionPopUp: UIView!
    @IBOutlet weak var completionButton: UIButton!
    
    // MARK: - Properties
    private let readViewStoryboard = UIStoryboard.init(name: "ReadView", bundle: nil)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    override func setStyle() {
        completionPopUp.layer.applyShadow(
            color: Const.Color.cmBlack01!,
            alpha: 25,
            x: 0, y: 4,
            blur: 4,
            spread: 0
        )
    }
    
    // MARK: - @IBAction Properties
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func completionButtonClicked(_ sender: UIButton) {
        guard let readViewController = self.readViewStoryboard.instantiateViewController(withIdentifier: ReadViewController.reuseIdentifier) as? ReadViewController
        else { return }
        self.navigationController?.pushViewController(readViewController, animated: true)
    }
}

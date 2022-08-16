//
//  FirstViewController.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/16.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tutorialLabel: UILabel!
    @IBOutlet weak var blackView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tutorialLabel.numberOfLines = 0
        tutorialLabel.font = .boldSystemFont(ofSize: 25)
        tutorialLabel.text = """
                            일기 씁시다!
                            잘 써봅시다!
                            """
        
        tutorialLabel.alpha = 0
        
        blackView.backgroundColor = .black
        blackView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.tutorialLabel.alpha = 1
        } completion: { _ in
            self.animateBlackView()
        }

    }
    
    func animateBlackView() {
        UIView.animate(withDuration: 2) {
            self.blackView.frame.size.width += 200
            self.blackView.alpha = 1
        } completion: { _ in
            
        }

    }


}

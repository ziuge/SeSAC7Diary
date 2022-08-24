//
//  BaseViewController.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/19.
//

import UIKit
import SnapKit

class BaseViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setConstraints()
    }
    
    func configure() { }
    
    func setConstraints() { }
    
    func showAlertMessage(title: String, button: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: button, style: .cancel)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    
}



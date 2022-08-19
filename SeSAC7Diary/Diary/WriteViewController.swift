//
//  WriteViewController.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/19.
//

import UIKit
import SnapKit

class WriteViewController: BaseViewController {
    
    var mainView = WriteView()
    
    // viewDidLoad 보다 먼저 실행
    override func loadView() { // super.loadView X
        self.view = mainView // mainView로 교체
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
//        mainView.delegate = self  // 이런 식으로 기능적인 부분 들어갈 수 있음
        mainView.titleTextField.addTarget(self, action: #selector(titleTextFieldClicked(_:)), for: .editingDidEndOnExit)
    }
    
    @objc func titleTextFieldClicked(_ textField: UITextField) {
        guard let text = textField.text, text.count > 0 else {
            showAlertMessage(title: "제목을 입력해주세요", button: "확인")
            return
        }
    }

    
}

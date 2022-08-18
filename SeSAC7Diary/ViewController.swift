//
//  ViewController.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/16.
//

import UIKit
import SeSAC7UIFramework
import SnapKit

class ViewController: UIViewController {

    let nameButton: UIButton = {
        let view = UIButton()
        view.setTitle("닉네임", for: .normal)
        view.backgroundColor = .black
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow

        configure()
        nameButton.addTarget(self, action: #selector(nameButtonClicked), for: .touchUpInside)
    }
    
    @objc func nameButtonClicked() {
        let vc = ProfileViewController()
        vc.saveButtonActionHandler = {
            self.nameButton.setTitle(vc.nameTextField.text, for: .normal)
        }
        
        present(vc, animated: true)
    }
    
    func configure() {
        view.addSubview(nameButton)
        
        nameButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(view)
        }
    }
}
    
//    var name = "고래밥"
//
//    private var age = 22
//
//    var testArray: Array<Int> = [1, 2, 3, 4]
//    var testDic: Dictionary<Int, String> = [:]
//    var testSet: Set = [2, 3, 4]
//
//
    
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        let vc = CodeProfileViewController() // 인스턴스 생성
//        vc.modalPresentationStyle = .overFullScreen
//        present(vc, animated: true) // 보여주기
//
//
//
//        testOpen()
//        showSesacAlert(title: "테스트", message: "메시지", buttonTitle: "변경") { _ in
//            self.view.backgroundColor = .lightGray
//        }
        
//        let image = UIImage(systemName: "star.fill")!
//        let shareURL = "https://www.apple.com"
//        let text = "WWDC What's New"
//        sesacShowActivityViewController(shareImage: image, shareURL: shareURL, shareText: text)
        
//        let web = OpenWebView() // 클래스의 인스턴스 생성
//        OpenWebView.presentWebViewController(self, url: "https://www.naver.com", transitionStyle: .present)
        



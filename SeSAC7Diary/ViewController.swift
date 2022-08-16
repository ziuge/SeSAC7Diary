//
//  ViewController.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/16.
//

import UIKit
import SeSAC7UIFramework

class ViewController: UIViewController {
    
    var name = "고래밥"
    
    private var age = 22

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        testOpen()
//        showSesacAlert(title: "테스트", message: "메시지", buttonTitle: "변경") { _ in
//            self.view.backgroundColor = .lightGray
//        }
        
//        let image = UIImage(systemName: "star.fill")!
//        let shareURL = "https://www.apple.com"
//        let text = "WWDC What's New"
//        sesacShowActivityViewController(shareImage: image, shareURL: shareURL, shareText: text)
        
//        let web = OpenWebView() // 클래스의 인스턴스 생성
        OpenWebView.presentWebViewController(self, url: "https://www.naver.com", transitionStyle: .present)
        
        
    }




}


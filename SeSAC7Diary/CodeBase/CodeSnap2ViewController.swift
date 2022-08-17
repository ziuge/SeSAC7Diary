//
//  CodeSnap2ViewController.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/17.
//

import UIKit

class CodeSnap2ViewController: UIViewController {

    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [redView, blackView].forEach { // 여기서 레이어 순서 결정
            view.addSubview($0)
        }
        
        redView.addSubview(yellowView)
        // containerView, stackView
        
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
        }
        
        blackView.snp.makeConstraints { make in
            make.edges.equalTo(redView).inset(50) // 다 안쪽으로
//            make.edges.equalTo(redView).offset(50) // x+50, y+50
        }
    }
    
}

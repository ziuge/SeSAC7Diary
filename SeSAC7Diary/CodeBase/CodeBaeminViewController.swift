//
//  CodeBaeminViewController.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/17.
//

import UIKit
import SnapKit

class CodeBaeminViewController: UIViewController {
    // MARK: 상단 바
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        view.layer.cornerRadius = 10
        return view
    }()
    
    let squareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let userButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "face.smiling"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let bellButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let locationButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        configuration.attributedTitle = AttributedString("집", attributes: container)
        configuration.image = UIImage(systemName: "chevron.down")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 4
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.tintColor = .white
        return button
    }()
    
    let searchTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.placeholder = "           포케? 돈까스? 커리?"
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textColor = .lightGray
        view.backgroundColor = .white
        return view
    }()
    
    let searchImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "magnifyingglass")
        view.tintColor = .systemMint
        return view
    }()
    
    // MARK: 메인 버튼
    let deliveryView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    let baeminoneView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    let takeoutView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    let bmartView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    let shoppingLiveView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    let giftView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    let koreaView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureUI()
    }
    
    func configureUI() {
        [topView, squareButton, userButton, bellButton, locationButton, searchTextField, searchImageView, deliveryView, baeminoneView, takeoutView, bmartView, shoppingLiveView, giftView, koreaView].forEach {
            view.addSubview($0)
        }
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(-20)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(searchTextField.snp.bottom).offset(12)
        }
        
        squareButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(6)
            make.width.height.equalTo(48)
            make.leadingMargin.equalTo(view.safeAreaLayoutGuide).offset(6)
        }
        
        userButton.snp.makeConstraints { make in
            make.centerY.equalTo(squareButton)
            make.width.height.equalTo(48)
            make.trailingMargin.equalTo(view.safeAreaLayoutGuide).offset(-6)
        }
        
        bellButton.snp.makeConstraints { make in
            make.centerY.equalTo(squareButton)
            make.width.height.equalTo(48)
            make.trailingMargin.equalTo(userButton.snp.leading).offset(-6)
        }
        
        locationButton.snp.makeConstraints { make in
            make.centerY.equalTo(squareButton)
            make.centerX.equalTo(view)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.leadingMargin.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailingMargin.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.top.equalTo(squareButton.snp.bottom)
            make.height.equalTo(44)
        }
        
        searchImageView.snp.makeConstraints { make in
            make.centerY.equalTo(searchTextField)
            make.leadingMargin.equalTo(searchTextField).offset(14)
            make.height.width.equalTo(18)
        }
        
        deliveryView.snp.makeConstraints { make in
            make.topMargin.equalTo(topView.snp.bottom).offset(30)
            make.leadingMargin.equalTo(view).offset(20)
            make.height.equalTo(140)
            let w = Int(view.frame.width / 2) - 35
            make.width.equalTo(w)
        }
        
        baeminoneView.snp.makeConstraints { make in
            make.topMargin.equalTo(topView.snp.bottom).offset(30)
            make.trailingMargin.equalTo(view).offset(-20)
            make.height.equalTo(140)
            let w = Int(view.frame.width / 2) - 35
            make.width.equalTo(w)
        }
        
        takeoutView.snp.makeConstraints { make in
            make.topMargin.equalTo(deliveryView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(view).offset(20)
            make.trailingMargin.equalTo(view).offset(-20)
            make.height.equalTo(90)
        }
        
        bmartView.snp.makeConstraints { make in
            make.topMargin.equalTo(takeoutView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(view).offset(20)
            make.height.equalTo(110)
            let w = Int(view.frame.width / 2) - 35
            make.width.equalTo(w)
        }
        
        shoppingLiveView.snp.makeConstraints { make in
            make.topMargin.equalTo(takeoutView.snp.bottom).offset(20)
            make.trailingMargin.equalTo(view).offset(-20)
            make.height.equalTo(110)
            let w = Int(view.frame.width / 2) - 35
            make.width.equalTo(w)
        }
        
        giftView.snp.makeConstraints { make in
            make.topMargin.equalTo(bmartView.snp.bottom).offset(20)
            make.leading.equalTo(bmartView)
            make.height.equalTo(110)
            let w = Int(view.frame.width / 2) - 35
            make.width.equalTo(w)
        }
        
        koreaView.snp.makeConstraints { make in
            make.topMargin.equalTo(bmartView.snp.bottom).offset(20)
            make.trailing.equalTo(shoppingLiveView)
            make.height.equalTo(110)
            let w = Int(view.frame.width / 2) - 35
            make.width.equalTo(w)
        }
    }
    
}

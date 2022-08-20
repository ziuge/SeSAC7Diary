//
//  CodeProfileViewController.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/17.
//

import UIKit

class CodeProfileViewController: UIViewController {

    let backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleToFill
        return view
    }()
    
    // MARK: 상단 버튼
    let xmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let boxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "shippingbox.circle"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let qrButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "qrcode.viewfinder"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gear.circle"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    // MARK: 프로필 부분
    let profileImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .systemIndigo
        view.layer.cornerRadius = 10
        return view
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.text = "Jack"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let profileMessage: UILabel = {
        let label = UILabel()
        label.text = "프로필 메시지"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.3)
        return view
    }()
    
    // MARK: 하단 버튼
    let chatButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        configuration.attributedTitle = AttributedString("나와의 채팅", attributes: container)
        configuration.image = UIImage(systemName: "message.fill")
        configuration.imagePlacement = .top
        configuration.imagePadding = 12
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.tintColor = .white
        return button
    }()
    
    let editButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        configuration.attributedTitle = AttributedString("프로필 편집", attributes: container)
        configuration.image = UIImage(systemName: "pencil")
        configuration.imagePlacement = .top
        configuration.imagePadding = 12
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.tintColor = .white
        return button
    }()
    
    let storyButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        configuration.attributedTitle = AttributedString("카카오스토리", attributes: container)
        configuration.image = UIImage(systemName: "quote.bubble.fill")
        configuration.imagePlacement = .top
        configuration.imagePadding = 12
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.tintColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        [backgroundImageView, xmarkButton, boxButton, qrButton, settingButton, chatButton, editButton, storyButton, lineView, profileMessage, name, profileImageView].forEach {
            view.addSubview($0)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
        
        // 상단 버튼
        xmarkButton.snp.makeConstraints { make in
            make.topMargin.equalTo(8)
            make.leadingMargin.equalTo(6)
            make.width.equalTo(44)
            make.height.equalTo(44)
            
        }
        
        boxButton.snp.makeConstraints { make in
            make.topMargin.equalTo(8)
            make.trailingMargin.equalTo(qrButton.snp.leading).offset(0)
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
        
        qrButton.snp.makeConstraints { make in
            make.topMargin.equalTo(8)
            make.trailingMargin.equalTo(settingButton.snp.leading).offset(0)
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
        
        settingButton.snp.makeConstraints { make in
            make.topMargin.equalTo(8)
            make.trailingMargin.equalTo(-8)
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
        
        // 프로필
        profileImageView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(80)
            make.bottomMargin.equalTo(name.snp.top).offset(-20)
            make.centerX.equalTo(view)
        }
        
        name.snp.makeConstraints { make in
            make.bottomMargin.equalTo(profileMessage.snp.top).offset(-24)
            make.centerX.equalTo(view)
        }
        
        profileMessage.snp.makeConstraints { make in
            make.bottomMargin.equalTo(lineView.snp.top).offset(-30)
            make.centerX.equalTo(view)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(view)
            make.bottomMargin.equalTo(editButton.snp.top).offset(-30)
        }
        
        // 하단 버튼
        chatButton.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(58)
            make.bottomMargin.equalTo(-40)
            make.trailingMargin.equalTo(editButton.snp.leading).offset(-12)
        }
        
        editButton.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(58)
            make.bottomMargin.equalTo(-40)
            make.centerX.equalTo(view)
        }
        
        storyButton.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(58)
            make.bottomMargin.equalTo(-40)
            make.leadingMargin.equalTo(editButton.snp.trailing).offset(12)
        }
        
    }

}

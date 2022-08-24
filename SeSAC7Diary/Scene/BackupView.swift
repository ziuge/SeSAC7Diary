//
//  BackupView.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/25.
//

import UIKit

class BackupView: BaseView {
    
    let backupButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setImage(UIImage(systemName: "star"), for: .normal)
        return view
    }()
    
    let recoveryButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .yellow
        view.setImage(UIImage(systemName: "pencil"), for: .normal)
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 100
        
        return view
    }()
    
    override func configureUI() {
        backgroundColor = Constants.BaseColor.background
        [backupButton, recoveryButton, tableView].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        backupButton.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(44)
            make.topMargin.equalTo(self.safeAreaLayoutGuide).offset(40)
            make.leadingMargin.equalTo(self.safeAreaLayoutGuide).offset(20)
        }
        
        recoveryButton.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(44)
            make.topMargin.equalTo(self.safeAreaLayoutGuide).offset(40)
            make.trailingMargin.equalTo(self.safeAreaLayoutGuide).offset(-20)
        }
        
        tableView.snp.makeConstraints { make in
            make.topMargin.equalTo(self.safeAreaLayoutGuide).offset(100)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    
}

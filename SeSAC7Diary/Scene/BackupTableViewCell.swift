//
//  BackupTableViewCell.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/25.
//

import UIKit

class BackupTableViewCell: BaseTableViewCell {
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = Constants.BaseColor.text
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        backgroundColor = Constants.BaseColor.background
        [titleLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.leadingMargin.equalTo(8)
        }
    }
    
}

//
//  BackupViewController.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/25.
//

import UIKit
import RealmSwift

class BackupViewController: BaseViewController {
    
    let mainView = BackupView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(BackupTableViewCell.self, forCellReuseIdentifier: BackupTableViewCell.reuseIdentifier)
    }
    
}

extension BackupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BackupTableViewCell.reuseIdentifier, for: indexPath) as? BackupTableViewCell else { return UITableViewCell()}
        
        cell.backgroundColor = Constants.BaseColor.background
        cell.titleLabel.text = "백업\(indexPath.row)"
        print("cell printing")
        
        return cell
    }
}

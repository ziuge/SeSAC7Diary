//
//  HomeViewController.swift
//  SeSAC2DiaryRealm
//
//  Created by jack on 2022/08/22.
//

import UIKit
import SnapKit
import RealmSwift //Realm 1. import
import MapKit

class HomeViewController: BaseViewController {
    
    let localRealm = try! Realm() // Realm 2.
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 100
        view.delegate = self
        view.dataSource = self
        view.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
        return view
    }()
    
    var tasks: Results<UserDiary>! {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! localRealm.write {
            localRealm.add(UserDiary(diaryTitle: "gg", diaryContent: "dd", diaryDate: Date(), regdate: Date(), photo: nil))
        }
        print()
    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchRealm()
    }
    
    func fetchRealm() {
        tasks = localRealm.objects(UserDiary.self).sorted(byKeyPath: "diaryTitle", ascending: true)
    }
    
    override func configure() {
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonClicked))
        
        let sortButton = UIBarButtonItem(title: "정렬", style: .plain, target: self, action: #selector(sortButtonClicked))
        let filterButton = UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(filterButtonClicked))
        navigationItem.leftBarButtonItems = [sortButton, filterButton]
    }
    
    override func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func plusButtonClicked() {
        let vc = WriteViewController()
        transition(vc, transitionStyle: .presentFullScreenNavigation)
    }
    
    @objc func sortButtonClicked() {
        tasks = localRealm.objects(UserDiary.self).sorted(byKeyPath: "regdate", ascending: true)
    }
    
    // Realm filter query 제공, NSPredicate
    @objc func filterButtonClicked() {
        tasks = localRealm.objects(UserDiary.self).filter("diaryTitle CONTAINS[c] 'a'")
            //.filter("diaryTitle = '오늘의 일기171'"
        // [c] -> 대소문자 상관없이
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier) as? HomeTableViewCell else { return UITableViewCell() }
        cell.diaryImageView.image = loadImageFromDocument(fileName: "\(tasks[indexPath.row].objectId).jpg")
        cell.setData(data: tasks[indexPath.row])
        return cell
    }
    
    // 테이블뷰 셀 높이가 작을 경우, 이미지가 없을 때, 시스템 이미지가 아닌 경우
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favorite = UIContextualAction(style: .normal, title: "즐겨찾기") { action, view, completionHandler in
            print("favorite btn clicked")
        }
        
        let example = UIContextualAction(style: .normal, title: "예시") { action, view, completionHandler in
            print("example btn clicked")
        }
        
        return UISwipeActionsConfiguration(actions: [favorite, example])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favorite = UIContextualAction(style: .normal, title: nil) { action, view, completionHandler in
            print("favorite btn clicked")
            
            // realm data update
            try! self.localRealm.write {
                // 하나의 레코드에서 특정 컬럼 하나만 변경
                self.tasks[indexPath.row].favorite = !self.tasks[indexPath.row].favorite
                
                // 하나의 테이블에 특정 컬럼 전체 값을 변경
                self.tasks.setValue(true, forKey: "favorite")
                
                // 하나의 레코드에서 여러 컬럼들이 변경
                self.localRealm.create(UserDiary.self, value: ["objectId": self.tasks[indexPath.row].objectId, "diaryContent": "변경 테스트", "diaryTitle": "제목"], update: .modified)
                
                
                print("Realm update success, reload 필요")
            }
            
            // 1. 스와이프한 셀 하나만 ReloadRows 코드를 구현
            // 2. 데이터가 변경되었으니 다시 realm에서 데이터를 가져오기 => didSet 일관적 형태로 갱신
            self.fetchRealm()
        }
        
        // realm 데이터 기준
        let image = tasks[indexPath.row].favorite ? "star.fill" : "star"
        favorite.image = UIImage(systemName: image)
        favorite.backgroundColor = .systemPink
        
        let example = UIContextualAction(style: .normal, title: "예시") { action, view, completionHandler in
            print("example btn clicked")
            
        }
        
        return UISwipeActionsConfiguration(actions: [favorite, example])
    }
}

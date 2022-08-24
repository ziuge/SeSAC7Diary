//
//  ImageSearchViewController.swift
//  SeSAC2DiaryRealm
//
//  Created by jack on 2022/08/21.
//

import UIKit
import Kingfisher

class SearchImageViewController: BaseViewController {
    
    var delegate: SelectImageDelegate?
    var selectImage: UIImage? // 이미지 전달 1.

    let mainView = ImageSearchView()

    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.BaseColor.background
    }

    override func configure() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(ImageSearchCollectionViewCell.self, forCellWithReuseIdentifier: ImageSearchCollectionViewCell.reuseIdentifier)
        
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem = closeButton
        
        let saveButton = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(selectButtonClicked))
        navigationItem.rightBarButtonItem = saveButton
        
        // 이미지 다운로드 받을 때 아무것도 못하도록 막는 기능들
//        view.isUserInteractionEnabled = false
//        mainView.collectionView.isUserInteractionEnabled = false
    }
    
    @objc func closeButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc func selectButtonClicked() {
        
        guard let selectImage = selectImage else {
            showAlertMessage(title: "사진을 선택해주세요", button: "확인")
            return
        }
        
        delegate?.sendImageData(image: selectImage)
        dismiss(animated: true)
    }
}
 
extension SearchImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageDummy.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSearchCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageSearchCollectionViewCell else {
            return UICollectionViewCell()
        }

//        cell.layer.borderWidth = selectIndexPath == indexPath ? 4 : 0
//        cell.layer.borderColor = selectIndexPath == indexPath ? Constants.BaseColor.point.cgColor : nil
        cell.setImage(data: ImageDummy.data[indexPath.item].url)

        return cell
    }

    // userInteractionEnabled & progress loading 보여주기
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 어떤 셀인지 어떤 이미지를 가지고 올 지 어떻게 알지??
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageSearchCollectionViewCell else { return }
        
        selectImage = cell.searchImageView.image
//        selectIndexPath = indexPath
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        selectIndexPath = nil
        selectImage = nil
        collectionView.reloadData()
    }
}

//
//  BaseView.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/19.
//

import UIKit
import SnapKit

class BaseView2: UIView {
    
    // 코드베이스일 때 호출
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    // xib storyboard, protocol
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() { }
    
    func setConstraints() { }
    
}


// required initializer
//protocol example {
//    init(name: String)
//}
//
//class Mobile: example {
//    let name: String
//
//    required init(name: String) { // protocol 안에 있는 애구나 -> required
//        self.name = name
//    }
//}
//
//class Apple: Mobile {
//    let wwdc: String
//
//    init(wwdc: String) {
//        self.wwdc = wwdc
//
//        super.init(name: "모바일")
//    }
    
//    required override init(name: String) {
//
//    }
    
//}
//
//let a = Apple(wwdc: "애플")

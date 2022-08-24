//
//  FileManager+Extension.swift
//  SeSAC7Diary
//
//  Created by CHOI on 2022/08/24.
//

import Foundation
import UIKit

extension UIViewController {
    func loadImageFromDocument(fileName: String) -> UIImage? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil } // Document 경로
        let fileURL = documentDirectory.appendingPathComponent(fileName) // 세부 경로
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path)
        } else {
            return UIImage(systemName: "star.fill")
        }
        
    }
    
    func removeImageFromDocument(fileName: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return } // Document 경로
        let fileURL = documentDirectory.appendingPathComponent(fileName) // 세부 경로
        
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch let error {
            print(error)
        }
        
    }
    
    func saveImageToDocument(fileName: String, image: UIImage) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return } // Document 경로
        let fileURL = documentDirectory.appendingPathComponent(fileName) // 세부 경로, 이미지를 저장할 위치
        guard let data = image.jpegData(compressionQuality: 0.5) else { return } // 이미지 압축
        
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("file save error", error)
        }
    }
}

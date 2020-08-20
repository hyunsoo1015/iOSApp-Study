//
//  ViewController.swift
//  PickerView
//
//  Created by 304 on 2020/08/18.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pickerView.selectRow(Int.random(in: 50000...99999), inComponent: 0, animated: true)
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var lblImageName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //이미지 파일 이름을 저장할 배열
    var imageFileName = [String]()
    //이미지를 저장할 배열
    var imageArray = [UIImage?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이미지 파일 배열과 이미지 배열에 데이터를 추가
        for i in 0...4 {
            imageFileName.append("red\(i).jpg")
            let image = UIImage(named: "red\(i).jpg")
            imageArray.append(image)
        }
        
        //레이블과 이미지 뷰 초기화
        lblImageName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
        //pickerView 의 프로토콜 메소드 구현 위치를 설정
        pickerView.delegate = self
        pickerView.dataSource = self
        
        NSLog("태그:\(pickerView.description)")
    }


}

//PickerView 관련 메소드를 구현할 extension
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    //열의 개수를 설정하는 메소드
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //행의 개수를 설정하는 메소드
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //배열의 데이터 개수 리턴
        //return imageFileName.count
        return 100000
    }
    
    /*
    //피커 뷰에 문자열을 출력해주는 메소드
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }
    */
    
    //피커 뷰에 뷰를 출력하는 메소드
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row % 5])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 130)
        return imageView
    }
    
    //피커 뷰에 높이를 설정하는 메소드
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 120
    }
 
    //선택을 했을 때 호출되는 메소드
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //선택된 행번호를 이용해서 레이블과 이미지 뷰를 재설정
        lblImageName.text = imageFileName[row % 5]
        imageView.image = imageArray[row % 5]
    }
}


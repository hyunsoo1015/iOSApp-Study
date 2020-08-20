//
//  ViewController.swift
//  View1
//
//  Created by 304 on 2020/08/17.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    
    //키보드가 화면에 출력될 때 호출될 메소드
    @objc func keyboardWillShow(notification: Notification) {
        //레이블을 위로 이동
        let frame = lblMsg.frame
        let moveFrame = CGRect(x: frame.origin.x, y: frame.origin.y - 50, width: frame.size.width, height: frame.size.height)
        lblMsg.frame = moveFrame
    }
    //키보드가 화면에서 없어질 때 호출될 메소드
    @objc func keyboardWillHide(notification: Notification) {
        //레이블을 위로 이동
        let frame = lblMsg.frame
        let moveFrame = CGRect(x: frame.origin.x, y: frame.origin.y + 50, width: frame.size.width, height: frame.size.height)
        lblMsg.frame = moveFrame
    }
    
    /*
    //텍스트 필드에서 return 키를 누르면 호출되는 메소드
    //swift 에서는 프로토콜의 메소드를 만들 때는
    //override를 붙이지 않음
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfMsg.resignFirstResponder()
    }
     */
    
    //터치가 발생할 때 호출되는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //상위 클래스의 메소드를 호출
        super.touchesBegan(touches, with: event)
        //FirstResponder 해제 - 키보드가 사라진다.
        tfMsg.resignFirstResponder()
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var lblMsg: UILabel!
    @IBOutlet weak var tfMsg: UITextField!
    
    @IBAction func click(_ sender: Any) {
        //텍스트 필드의 내용을 레이블에 출력
        lblMsg.text = tfMsg.text
        //텍스트 필드의 내용 초기화
        tfMsg.text = ""
    }
    
    //뷰 컨트롤러의 뷰들을 메모리에 로드하고 호출되는 메소드
    //초기화 작업은 이 메소드나 viewWillAppear 메소드를 이용
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //노티피케이션 등록 - selector 대신에 closure 사용 가능
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //closure를 이용한 타이머 생성
        var timer : Timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){(t: Timer) -> Void in
            
        let date: Date = Date()
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd ccc hh:mm:ss"
        let msg = formatter.string(from: date)
            
        //클로저 안에서 외부 클래스의 인스턴스 속성을
        //참조할 때는 반드시 self를 붙여야 한다.
        //iOS에서는 함부로 self를 생략하면 안된다.
        self.label.text = msg
    }
        
        //위치나 크기 또는 각도 변환 - transform
        label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        //세부적인 옵션은 layer를 이용해서 변경
        label.layer.borderWidth = 3
        //속성을 설정하다보면 UI타입이 아닌 CG 타입으로
        //설정해야 하는 경우가 있다.
        //Objective-C 에서는 클래스 형태의 속성을
        //사용하다가 Swift에서는 값만 필요한 경우에는
        //struct로 변경해서 발생
        label.layer.borderColor = UIColor.red.cgColor
        
        //tfMsg를 FirstResponder로 설정
        //시작하자마자 키보드가 화면에 출력
        tfMsg.becomeFirstResponder()
        
        //tfMsg의 delegate를 설정
        //tfMsg.delegate = self
    }
}

extension ViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfMsg.resignFirstResponder()
    }
}


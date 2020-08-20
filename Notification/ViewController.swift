import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func messageClick(_ sender: Any) {
        //대화상자 생성
        let alert = UIAlertController(title: "메시지 대화상자", message: "메시지를 전달하는 대화상자입니다.", preferredStyle: .alert)
        
        //대화상자에 배치할 수 있는 버튼을 생성
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        //버튼을 대화상자에 추가
        alert.addAction(cancel)
        //클로저를 내부에 생성 - Swift 문법에서 사용
        /*
        let ok = UIAlertAction(title: "확인", style: .default, handler: {(alert) -> Void in
            NSLog("확인버튼을 클릭하셨습니다.")
        })
        */
        
        //클로저를 외부에 생성 - trailing closure
        //iOS 샘플 코드가 많이 사용
        let ok = UIAlertAction(title: "확인", style: .default) {(alert) -> Void in NSLog("확인 버튼을 클릭")}
        alert.addAction(ok)
        
        //대화상자 출력 - UIViewController
        self.present(alert, animated: true)
        //콘솔에 텍스트 출력
        //비동기적으로 동작하기 때문에 대화상자 출력여부와
        //상관없이 수행
        NSLog("이 코드의 수행순서와 대화상자는 상관없음")
    }
    
    @IBAction func login(_ sender: Any) {
        let login = UIAlertController(title: nil, message: "로그인", preferredStyle: .alert)
        //텍스트 필드 추가
        login.addTextField() {(tf) -> Void in
            tf.placeholder = "아이디를 입력하세요"
        }
        
        login.addTextField() {(tf) -> Void in
            tf.placeholder = "비밀번호를 입력하세요"
            tf.isSecureTextEntry = true
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        login.addAction(cancel)
        
        let ok = UIAlertAction(title: "확인", style: .default) {(alert) -> Void in
            let id = login.textFields?[0].text
            let pw = login.textFields?[1].text
            
            if id == "root" && pw == "system" {
                NSLog("로그인 성공")
            } else {
                NSLog("로그인 실패")
            }
        }
        login.addAction(ok)
        present(login, animated: true)
    }
}


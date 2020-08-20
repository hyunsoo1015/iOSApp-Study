//
//  ViewController.swift
//  ViewSwitching
//
//  Created by 304 on 2020/08/19.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func detailDisplay(_ sender: Any) {
        //스토리보드에 디자인 한 뷰 컨트롤러 인스턴스를 생성
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        //푸시
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    @IBOutlet weak var lblMsg: UILabel!
    
    @IBAction func next(_ sender: Any) {
        
        //SecondViewController 객체 생성
        let secondViewController = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        
        //애니메이션 설정 - 반대로 돌아올 때도 적용이 된다.
        secondViewController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        secondViewController.data = "두번째 뷰 컨트롤러"
        
        //출력
        self.present(secondViewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "1"
    }

    //세그웨이를 이용해서 이동하는 경우 호출되는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //세그웨이의 목적지가 되는 뷰 컨트롤러 가져오기
        let secondViewController = segue.destination as! SecondViewController
        secondViewController.data = "세그웨이를 이용한 이동"
    }
    
    //세그웨이를 이용해서 돌아올 때 호출될 메소드
    //이 메소드의 이름은 아무런 의미가 없다.
    //이 메소드와 동일한 
    @IBAction func returned(segue: UIStoryboardSegue) {
        lblMsg.text = "세그웨이를 이용해서 돌아옴"
    }

}


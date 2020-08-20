//
//  SecondViewController.swift
//  ViewSwitching
//
//  Created by 304 on 2020/08/19.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    
    //문자열 변수
    var data: String!
    
    @IBAction func back(_ sender: Any) {
        //이전 뷰 컨트롤러로 돌아가기
        let viewController = presentingViewController as! ViewController
        viewController.lblMsg.text = "첫번째 뷰 컨트롤러"
        viewController.dismiss(animated: true)
        self.presentingViewController!.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if data != nil {
            lblText.text = data
        }
    }
}

//
//  ViewController.swift
//  Table
//
//  Created by 304 on 2020/08/19.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //테이블 뷰에 출력할 데이터
    var data = Array<String>()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "iOS App"
        
        //데이터 추가
        data.append("기본 테이블")
        
        //테이블 뷰의 delegate 와 dataSource 설정
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    //셀을 설정하는 메소드
    //indexPath 가 셀의 위치
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀의 아이디
        let cellIdentifier = "Cell"
        //셀을 생성 - 재사용 가능한 셀로 생성
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        //재사용 가능한 셀이 없으면 생성
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        //셀에 데이터를 출력
        cell!.textLabel!.text = data[indexPath.row]
        //셀을 리턴
        return cell!
        
    }
}


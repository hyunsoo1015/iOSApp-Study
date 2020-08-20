//
//  ViewController.swift
//  View2
//
//  Created by 304 on 2020/08/17.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //이미지 뷰 변수
    //!를 붙여서 변수를 선언하면
    //nil을 대입할 수 있고 사용을 할 때는 !없이 사용 가능
    var imgView: UIImageView!
    
    //이전 확대 축소 배율을 저장할 변수
    var oldScale: CGFloat = 1.0
    
    //마지막 회전 각도를 저장할 변수
    var originRotation: CGFloat = 0
    var lastRotation: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        //디바이스의 origin 과 size를 저장
        let rect: CGRect = UIScreen.main.bounds
        //인스턴스를 생성
        //전체 화면 크기의 절반으로 생성
        imgView = UIImageView(frame: CGRect(x: 50, y: 50, width: rect.size.width/2, height: rect.size.height/2))
        //중앙에 배치
        imgView.center = self.view.center
        
        //출력할 이미지 객체 생성
        let image: UIImage! = UIImage(named: "red0.jpg")
        //이미지 뷰에 이미지 설정
        imgView.image = image
        
        //이미지 뷰를 현재 뷰에 추가
        self.view.addSubview(imgView)
        
        //이미지 뷰가 터치를 받을 수 있도록 설정
        imgView.isUserInteractionEnabled = true
        
        //탭 제스쳐 생성
        let tap = UITapGestureRecognizer(target: self, action: #selector(tagGestureRecognizerMethod(sender:)))
        //옵션 설정
        tap.numberOfTapsRequired = 2 //2손가락으로 두드려야 함
        tap.numberOfTouchesRequired = 2 //2번 두드려야 동작
        //뷰에 적용
        imgView.addGestureRecognizer(tap)
        
        //핀치 제스쳐를 생성해서 imgView에 적용
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchMethod(sender:)))
        imgView.addGestureRecognizer(pinch)
        
        //회전 제스쳐를 생성해서 imgView에 적용
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateMethod(sender:)))
        imgView.addGestureRecognizer(rotate)
    }
    
    //탭 제스쳐에 연결할 메소드를 생성
    @objc func tagGestureRecognizerMethod(sender: UITapGestureRecognizer) {
        if imgView.contentMode == UIView.ContentMode.scaleAspectFit {
            imgView.contentMode = UIView.ContentMode.center
        } else {
            imgView.contentMode = UIView.ContentMode.scaleAspectFit
        }
    }
    
    //핀치 제스쳐에 연결할 메소드를 생성
    @objc func pinchMethod(sender: UIPinchGestureRecognizer) {
        //현재 배율을 가져온다.
        let newScale = sender.scale
        //확대 축소
        if newScale > 1 {
            imgView.transform = CGAffineTransform(scaleX: oldScale + (newScale - 1), y: oldScale + (newScale - 1))
        } else {
            imgView.transform = CGAffineTransform(scaleX: newScale, y: newScale)
        }
        
        //핀치가 종료되면 현재 확대 축소 배율을 저장
        if sender.state == UIGestureRecognizer.State.ended {
            if newScale > 1 {
                oldScale = oldScale + (newScale - 1)
            } else {
                oldScale = oldScale * newScale
            }
        }
    }
    
    //UIRotationGestureRecognizer 에 적용하기 위한
    //메소드
    @objc func rotateMethod(sender: UIRotationGestureRecognizer) {
        if sender.state == .began {
            sender.rotation = lastRotation
            originRotation = sender.rotation
        } else if sender.state == .changed {
            let newRotation = sender.rotation + originRotation
            imgView.transform = CGAffineTransform(rotationAngle: newRotation)
        } else if sender.state == .ended {
            lastRotation = sender.rotation
        }
    }
}


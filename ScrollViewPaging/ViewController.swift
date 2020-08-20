import UIKit

class ViewController: UIViewController {
    
    //nil을 저장할 수 있는 UIScrollView 변수
    //강제로 wrapping을 벗겨내지 않고 사용 가능
    var scrollView: UIScrollView!
    //스크롤 뷰 위에 놓일 콘텐츠 뷰 변수 - nil 저장 가능
    //wrapping을 없애고 사용
    var contentView: UIView?
    
    //loadView -> viewDidLoad : 생성
    //viewWillAppear -> viewDidAppear : 보여질 때
    
    //viewDidUnload : 없어질 때
    //viewWillDisappear -> viewDidDisappear
    //:화면에서 사라질 때

    //뷰가 메모리에 로드 되고 난 후 호출
    //뷰 컨트롤러가 생성될 때 만 호출된다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //화면 전체 크기 가져오기
        let mainSize = UIScreen.main.bounds.size
        
        //스크롤 뷰 생성하기
        scrollView = UIScrollView(frame: CGRect(x: 50, y: 50, width: mainSize.width / 2, height: mainSize.height / 2))
        //scrollView 의 위치를 정 가운데로 이동
        scrollView.center = view.center
        
        //콘텐츠 뷰 생성
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: mainSize.width / 2 * 4, height: mainSize.height / 2))
        
        //contentView 위에 이미지 뷰를 4개를
        //수평 방향으로 배치
        
        //각 이미지 뷰의 x 좌표를 저장
        var total: CGFloat = 0
        for i in 0...3 {
            //이미지 뷰를 생성
            let imageView = UIImageView(frame: CGRect(x: CGFloat(total), y: 0, width: mainSize.width / 2, height: mainSize.height / 2))
            total = total + mainSize.width / 2
            
            //이미지 생성
            let image = UIImage(named: "red\(i).jpg")
            
            imageView.image = image
            
            //contentView 에 이미지 뷰를 추가
            contentView?.addSubview(imageView)
        }
        
        //스크롤 뷰에 contentView를 배치
        scrollView.addSubview(contentView!)
        
        //스크롤 뷰의 스크롤 크기를 설정하고
        //페이지 단위로 스와이프 되도록 설정
        scrollView.contentSize = contentView!.frame.size
        scrollView.isPagingEnabled = true
        //현재 뷰에 스크롤 뷰 추가
        view.addSubview(scrollView)
    }
}


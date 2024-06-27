//
//  MyPageViewController.swift
//  Mini_Try2_SMUPool
//
//  Created by 문정현 on 6/23/24.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var LogoutButton:UIButton!
    
    @IBOutlet weak var namechangeTF:UITextField!
    
    @IBOutlet weak var changeButton:UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 로그아웃 버튼 디자인 설정
        configureLogoutButton()
        
        // changeButton 디자인 설정
        configureChangeButton()
        
        // namechangeTF 디자인 설정
        configurenamechangeTF()
        
        setupNavigationBar()
        
    }
    
    private func setupNavigationBar() {
        let backButtonImage = UIImage(named: "Vector")?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonPressed))
        
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonPressed() {
        // 스토리보드에서 HomeViewController로 전환
        if let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController {
            navigationController?.pushViewController(homeVC, animated: true)
            }
    }
    
    func configureLogoutButton() {
        
        // Asset에 저장된 색상을 가져와서 사용하는 예제
        if let buttonColor = UIColor(named: "SubColor_Skyblue") {
            LogoutButton.layer.borderColor = buttonColor.cgColor
        }
        
        
        
        // 버튼의 테두리 둥글게 설정
        LogoutButton.layer.cornerRadius = LogoutButton.frame.height / 2
        
        // 버튼의 테두리 색상 설정 (파란색)
        LogoutButton.layer.borderWidth = 1.0
        
        
        // 필요 시 배경색 설정을 할 수는 있지만 굳이?
        LogoutButton.backgroundColor = UIColor.clear
    }
    
    func configureChangeButton() {
        // changeButton의 디자인 설정
        changeButton.layer.cornerRadius = 10.0 // 각 모서리를 조금씩 둥글게 설정
        
        //changeButton.layer.borderWidth = 1.0
        //ㄴ> 이건 테두리의 크기 설정
        
        
        
    }
    
    
    func configurenamechangeTF() {
        // namechangeTF의 디자인 설정
        namechangeTF.borderStyle = .none
        namechangeTF.backgroundColor = UIColor.clear
        // placeholder의 색상을 바꾸기 위해 NSAttributedString을 사용
        // placeholder의 색상과 글자 크기를 변경하기 위해 NSAttributedString을 사용
        let placeholderText = "채팅 닉네임 변경하기"
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,        // placeholder의 색상
            .font: UIFont.systemFont(ofSize: 18.0) // placeholder의 글자 크기
                ]
        namechangeTF.attributedPlaceholder
        = NSAttributedString(string: placeholderText,attributes: placeholderAttributes)
            }
    
    

}


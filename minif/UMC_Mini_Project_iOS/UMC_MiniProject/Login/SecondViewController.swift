//
//  SeconfViewController.swift
//  Mini_Try2_SMUPool
//
//  Created by 문정현 on 5/23/24.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var HakBuk2: UITextField!
    @IBOutlet weak var password2: UITextField!
    @IBOutlet weak var Login2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupPlaceholders()
        Login2.layer.cornerRadius = 10
        Login2.clipsToBounds = true
        
        // 로그인 버튼 둥글게했고
    
    }
    // 텍스트 필드 설정 메소드
    private func setupTextFields() {
        HakBuk2.layer.cornerRadius = 10
        HakBuk2.layer.borderColor = UIColor.lightGray.cgColor
        HakBuk2.layer.borderWidth = 1
        
        //학번 텍필 둥글게 했고, 내부 색상 완료
        
        password2.layer.cornerRadius = 10
        password2.layer.borderColor = UIColor.lightGray.cgColor
        password2.layer.borderWidth = 1
        
       //22
    }

    // Placeholder 설정 메소드
    private func setupPlaceholders() {
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkblue,
            .font: UIFont.boldSystemFont(ofSize: 14)
        ]
    
        HakBuk2.attributedPlaceholder = NSAttributedString(string: "  학번", attributes: placeholderAttributes)
        password2.attributedPlaceholder = NSAttributedString(string: "  비밀번호", attributes: placeholderAttributes)
    }

        //내부 색상 및 언어 설정 완료

    
}


    

    
    



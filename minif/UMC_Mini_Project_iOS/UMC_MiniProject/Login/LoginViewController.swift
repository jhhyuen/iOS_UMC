import UIKit

class LoginViewController: UIViewController {

    var secondViewController: SecondViewController?
    var HakBun = String()
    var password = String()

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var hakbunTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        // ------ 로그인 API 호출 --------try_1
             //let enteredHakBun = hakbunTextField.text ?? ""
             //let enteredPassword = passwordTextField.text ?? ""

             // 로그인 API 호출
             //login(hakbun: enteredHakBun, password: enteredPassword)
             
             // 입력된 학번과 비밀번호 가져오기
            // let enteredHakBun = hakbunTextField.text ?? ""
             //let enteredPassword = passwordTextField.text ?? ""

             // -------로그인 성공 시 HomeVievController로 화면 전환하는 코드 - 조건문 - 일단 임의로 특정 학번, 비밀번호 설정한 코드-------try_2
             //if enteredHakBun == "202400000" && enteredPassword == "sangmyung00" {
             // 로그인 성공 - 다른 화면으로 전환하기
            // let storyboard = UIStoryboard(name: "Main", bundle: nil)
                // if let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController {
                   //  self.navigationController?.pushViewController(secondVC, animated: true)
                    //     }
            // } else {
             // 로그인 실패: UI의 색상을 빨강색으로 변경
           //  hakbunTextField.layer.borderColor = UIColor.red.cgColor
            // passwordTextField.layer.borderColor = UIColor.red.cgColor
                 //}
                 //}
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupPlaceholders()
        LoginButton.layer.cornerRadius = 10
        LoginButton.clipsToBounds = true
    }

    // 텍스트 필드 설정 메소드
    private func setupTextFields() {
        hakbunTextField.layer.cornerRadius = 10
        hakbunTextField.layer.borderColor = UIColor.lightGray.cgColor
        hakbunTextField.layer.borderWidth = 1
        
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 1
        
        // signup 버튼에 밑줄 추가
        let signupTitle = signupButton.title(for: .normal) ?? "회원가입" // 버튼의 타이틀을 가져옵니다.
        let attributedString = NSMutableAttributedString(string: signupTitle)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributedString.length))
        signupButton.setAttributedTitle(attributedString, for: .normal)
    }

    // Placeholder 설정 메소드
    private func setupPlaceholders() {
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkblue,
            .font: UIFont.boldSystemFont(ofSize: 14)
        ]
    
        hakbunTextField.attributedPlaceholder = NSAttributedString(string: "   학번", attributes: placeholderAttributes)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "   비밀번호", attributes: placeholderAttributes)
    }

    @IBAction func HakBun(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.HakBun = text
    }

    @IBAction func password(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }

    @IBAction func signupButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
        
        // 입력된 학번과 비밀번호 가져오기 - 근데 이거 이미 위에 IBAction
        let enteredHakBun = hakbunTextField.text ?? ""
        let enteredPassword = passwordTextField.text ?? ""

        // 로그인 성공 - 조건 만들기 ( HOW ??? )
            if enteredHakBun == "올바른 학번" && enteredPassword == "올바른 비밀번호" {
        // 로그인 성공 - 다른 화면으로 전환하기!!!
            } else {
                // 로그인 실패: UI의 색상을 빨강색으로 변경
                hakbunTextField.layer.borderColor = UIColor.red.cgColor
                passwordTextField.layer.borderColor = UIColor.red.cgColor
            }
        
        
    
    }
}



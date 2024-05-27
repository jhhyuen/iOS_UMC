import UIKit

class LoginViewController: UIViewController {

    var secondViewController: SecondViewController?
    var HakBun = String()
    var password = String()

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var hakbunTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupPlaceholders()
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
    
        hakbunTextField.attributedPlaceholder = NSAttributedString(string: "학번", attributes: placeholderAttributes)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: placeholderAttributes)
    }

    @IBAction func HakBun(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.HakBun = text
    }

    @IBAction func password(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }

    @IBAction func signupButton(_ sender: Any) {
        
        // 화면전환
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "≈") as! SecondViewController

        // 화면전환 메소드를 이용해서 화면을 전환
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}


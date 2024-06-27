//
//  MatchViewController.swift
//  miniProject-home
//
//  Created by 김민지 on 6/23/24.
//

import UIKit

class MatchTableViewController: UIViewController {
}

class MatchTableViewCell: UITableViewCell {
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var splitBill: UILabel!
    
    @IBAction func matchRequest(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTextFields()
    }

    // cancel 버튼에 밑줄 추가
    private func setupTextFields() {
        let signupTitle = cancelButton.title(for: .normal) ?? "취소"
        let attributedString = NSMutableAttributedString(string: signupTitle)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributedString.length))
        cancelButton.setAttributedTitle(attributedString, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  TimeTableViewCell.swift
//  miniProject-home
//
//  Created by 김민지 on 6/23/24.
//

import UIKit

class TimeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateSet: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    // 취소 버튼 액션
    @IBAction func closeButton(_ sender: Any) {
        guard let parentVC = self.parentViewController as? TimeViewController else { return
        }
        parentVC.dismiss(animated: true, completion: nil)
    }
    
    // 선택 버튼 액션
    @IBAction func chooseButton(_ sender: Any) {
    }
    
    @IBAction func rideButton(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}

// UITableViewCell extension to get parent view controller
extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while let responder = parentResponder {
            parentResponder = responder.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

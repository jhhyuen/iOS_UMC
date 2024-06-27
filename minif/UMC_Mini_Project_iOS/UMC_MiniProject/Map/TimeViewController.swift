//
//  TimeViewController.swift
//  miniProject-home
//
//  Created by 김민지 on 6/17/24.
//

import UIKit

class TimeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 셀 등록
        let nib = UINib(nibName: "TimeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "TimeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
      
    // UITableViewDataSource 메서드 구현
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // 예제 데이터
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableViewCell", for: indexPath) as? TimeTableViewCell else {
            fatalError("Unable to dequeue TimeTableViewCell")
        }
        // 필요한 추가 설정
        
        return cell
    }

}

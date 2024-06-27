//
//  StationTableViewController.swift
//  miniProject-home
//
//  Created by 김민지 on 5/26/24.
//

import UIKit

class StationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 역 모달안에 있는 셀 등록
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // UITableViewDataSource 메서드 구현
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // 예제 데이터
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 셀 가져오기
        let stationCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        stationCell.textLabel?.text = "역 \(indexPath.row+1)번 출구"
       
        // 셀의 선택 스타일 설정
        stationCell.selectionStyle = .default
        
        return stationCell
    }
    
    // 셀 선택시 TimeVC로 화면 전환
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 셀 선택 해제
        tableView.deselectRow(at: indexPath, animated: true)
        
       // 선택된 셀에 대한 처리
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let timeVC = storyboard.instantiateViewController(withIdentifier: "TimeVC") as? TimeViewController else {
                return
            }
        navigationController?.pushViewController(timeVC, animated: true)
        // 모달로 표시
        timeVC.modalPresentationStyle = .overCurrentContext
        timeVC.modalTransitionStyle = .crossDissolve
        present(timeVC, animated: true, completion: nil)
        
    }
}


        



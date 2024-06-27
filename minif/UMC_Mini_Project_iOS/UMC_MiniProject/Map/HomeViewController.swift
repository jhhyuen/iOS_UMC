//
//  ViewController.swift
//  miniProject-home
//
//  Created by 김민지 on 5/26/24.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var ProfileButton: UIButton!
    @IBOutlet weak var MessageButton: UIButton!
    @IBOutlet weak var CarpoolButton: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMapView()
        setupLocationManager()
        
        // 버튼들 가장 위로 올리기
        view.bringSubviewToFront(ProfileButton)
        view.bringSubviewToFront(MessageButton)
        view.bringSubviewToFront(CarpoolButton)
    }
    
    func setupMapView() {
        // MKMapView 인스턴스 생성 및 설정
        mapView = MKMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow

        // 뷰에 지도 추가
        view.addSubview(mapView)
    }

    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        checkLocationAuthorization()
    }

    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startUpdatingUserLocation()
        case .denied, .restricted:
            // 사용자가 위치 서비스 사용을 거부한 경우 처리할 로직 추가
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            break
        }
    }

    func startUpdatingUserLocation() {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow

        // 현재 위치로 지도의 중심 이동
        if let userLocation = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
    }

    
    // MARK: - Actions
    @IBAction func messageButton(_ sender: Any) {
        // ChatRoomViewController 인스턴스 생성
        let channel = Channel(name: "택시 카풀 그룹 채팅방")
        let chatRoomVC = ChatRoomViewController(channel: channel)
        
        // ChatRoomViewController로 전환
        navigationController?.pushViewController(chatRoomVC, animated: true)
    }
    
    
    @IBAction func carpoolButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let stationVC = storyboard.instantiateViewController(withIdentifier: "StationVC") as? StationViewController else {
            return
        }
        
        // 모달로 표시
        stationVC.modalPresentationStyle = .pageSheet
        
        if let sheet = stationVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.selectedDetentIdentifier = .medium
            sheet.prefersGrabberVisible = true // 손잡이 표시
        }
        
        self.present(stationVC, animated: true, completion: nil)
    }
    
}
            
            
          

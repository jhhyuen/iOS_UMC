//
//  BaseMapViewController.swift
//  UMC_MiniProject
//
//  Created by 문정현 on 6/24/24.
//

//import UIKit
//import MapKit
//import CoreLocation
//
//class BaseMapViewController: UIViewController {
//
//    var mapView: MKMapView!
//    var locationManager: CLLocationManager!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // MKMapView 인스턴스 생성
//        mapView = MKMapView(frame: view.bounds)
//        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        mapView.showsUserLocation = true
//        mapView.userTrackingMode = .follow
//        
//        // 뷰에 지도 추가
//        view.addSubview(mapView)
//
//        // 현재 위치로 지도의 중심 이동
//        if let userLocation = locationManager.location?.coordinate {
//            let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
//            mapView.setRegion(region, animated: true)
//        }
//        
//        // 위치 서비스 설정 및 권한 확인
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        checkLocationAuthorization()
//        
//        // 현재 위치로 지도의 중심 이동
//        moveMapToCurrentLocation()
//    }
//
//
//    // 위치 서비스 권한 설정
//    func checkLocationAuthorization() {
//        switch CLLocationManager.authorizationStatus() {
//        case .authorizedWhenInUse:
//            startUpdatingUserLocation()
//        case .denied, .restricted:
//            // 사용자가 위치 서비스 사용을 거부한 경우 처리할 로직 추가
//            break
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        default:
//            break
//        }
//    }
//
//    // 사용자 위치 업데이트
//    func startUpdatingUserLocation() {
//        mapView.showsUserLocation = true
//        mapView.userTrackingMode = .follow
//    }
//    
//    // 지도의 현재 위치로 이동
//    func moveMapToCurrentLocation() {
//        if let userLocation = locationManager.location?.coordinate {
//             let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
//             mapView.setRegion(region, animated: true)
//         }
//     }
//}
//
//extension BaseMapViewController: CLLocationManagerDelegate {
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse {
//            startUpdatingUserLocation()
//        }
//    }
//}

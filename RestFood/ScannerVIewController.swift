//
//  ScannerVIewController.swift
//  RestFood
//
//  Created by Danil on 15.03.2024.
//

import UIKit
import SnapKit
import AVFoundation
protocol ScannerViewControllerProtocol: AnyObject {
    
}
class ScannerViewController: UIViewController {
    var presenter: ScannerPresenterProtocol!
    let captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    lazy var header: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Scan QR"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var scanView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        setupCamera()
        
    }
    func setupViews() {
        view.addSubview(header)
        header.addSubview(headerLabel)
        view.addSubview(scanView)
    }
    func setupCamera() {
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: captureDevice)
        } catch {
            print(error.localizedDescription)
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            print("Unable to add input device to capture session")
            return
        }
        let metadataOutput = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            print("Unable to add metadata output to capture session")
            return
        }
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer.frame = view.layer.bounds
        scanView.layer.addSublayer(videoPreviewLayer)
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.captureSession.startRunning()
        }
    }
    func setupConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        headerLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        scanView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        
    }
}
extension ScannerViewController: ScannerViewControllerProtocol {
    
}
extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            if metadataObject.type == .qr, let qrCode = metadataObject.stringValue {
                self.headerLabel.text = qrCode
            }
        }
    }
    
}

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
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 15
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var header: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        setupViews()
        setupConstraints()
        setupCamera()
        
    }
    func setupViews() {
        view.addSubview(header)
        header.addSubview(headerLabel)
        header.addSubview(backButton)
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
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.width.equalTo(25)
            make.trailing.equalTo(-10)
        }
        header.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
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
    @objc func close() {
        presenter.close()
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension ScannerViewController: ScannerViewControllerProtocol {
    
}
extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            if metadataObject.type == .qr, let qrCode = metadataObject.stringValue {
                presenter.qrDecode(dataOfTable: qrCode) {[weak self] tableNumber, error in
                    switch(tableNumber, error) {
                    case let (.some(tableNumber), _):
                        self?.headerLabel.text = tableNumber // TODO: сделать обработку ошибок
                        self?.captureSession.stopRunning()
                        self?.presenter.close()
                    case let (_, .some(error)): // тут тоже поправить 
                        self?.headerLabel.text = "incorrect qr"
                    default:
                        return
                    }
                }
            }
        }
    }
}

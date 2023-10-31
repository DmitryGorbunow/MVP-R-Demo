//
//  FirstView.swift
//  MVP+R-Demo
//
//  Created by Dmitry Gorbunow on 10/28/23.
//

import UIKit
import SnapKit

protocol FirstViewProtocol: UIView {
    var goToLoginHandler: (() -> Void)? { get set }
    var goToDemoHandler: (() -> Void)? { get set }
    
    func update(data: String)
    func getTextFieldData() -> String
}

final class FirstView: UIView {
    var goToLoginHandler: (() -> Void)?
    var goToDemoHandler: (() -> Void)?
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to the Betta Bank!"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(named: "yellowButton")
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var demoButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "yellowButton")?.cgColor
        button.setTitle("Demo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(demoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(logInButton)
        addSubview(demoButton)
        addSubview(welcomeLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(128)
            $0.left.right.equalToSuperview().inset(32)
        }
        
        logInButton.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(64)
            $0.width.equalTo(150)
            $0.height.equalTo(49)
        }
        
        demoButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(64)
            $0.right.equalToSuperview().inset(16)
            $0.width.equalTo(150)
            $0.height.equalTo(49)
        }
        
    }
    
    @objc private func logInButtonTapped() {
        self.goToLoginHandler?()
    }
    
    @objc private func demoButtonTapped() {
        self.goToDemoHandler?()
    }
}

extension FirstView: FirstViewProtocol {
    func update(data: String) {
        
    }
    
    func getTextFieldData() -> String {
        ""
    }
}


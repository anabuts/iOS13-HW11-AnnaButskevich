//
//  ViewController.swift
//  iOS13-HW11-AnnaButskevich
//
//  Created by Анна Буцкевич on 11.06.24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - Outlets

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .systemGray
        textField.textAlignment = .left
        textField.placeholder = "Name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .systemGray
        textField.textAlignment = .left
        textField.placeholder = "Password"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(nameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(button)
    }

    private func setupLayout() {

        titleLabel.snp.makeConstraints {make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
        }

        nameTextField.snp.makeConstraints {make in
            make.center.equalTo(view)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40)
            make.bottom.equalTo(passwordTextField.snp.top).offset(-20)
            make.height.equalTo(50)
        }

        passwordTextField.snp.makeConstraints {make in
            make.center.equalTo(view)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(50)
        }

        button.snp.makeConstraints {make in
            make.centerX.equalTo(view)
            make.leading.equalToSuperview().offset(40)
            make.top.equalTo(passwordTextField.snp.bottom).offset(60)
            make.height.equalTo(50)
        }
    }

    // MARK: - Action

    @objc private func buttonPressed() {

    }
}

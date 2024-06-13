//
//  ViewController.swift
//  iOS13-HW11-AnnaButskevich
//
//  Created by Анна Буцкевич on 11.06.24.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    // MARK: - UI

    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "background image")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.placeholder = "Name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftIcon(UIImage(named: "user") ?? UIImage.remove)
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.placeholder = "Password"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftIcon(UIImage(named: "lock") ?? UIImage.remove)
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = .zero
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 8
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        return button
    }()

    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.clipsToBounds = true
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var networksLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "or connect with"
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 16)
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private lazy var facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = .zero
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 8
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        return button
    }()

    private lazy var twitterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = .zero
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 8
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        return button
    }()

    private lazy var networkHorizantalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [facebookButton, twitterButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()

    private lazy var createAcountLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Don't have account?"
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 16)
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()

    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var signUpHorizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [createAcountLabel, signUpButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 10
        return stack
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        [imageView, titleLabel, nameTextField, passwordTextField, loginButton, forgotPasswordButton, networksLabel, networkHorizantalStack, signUpHorizontalStack].forEach {view.addSubview($0)
        }
    }

    private func setupLayout() {

        imageView.snp.makeConstraints {make in
            make.center.equalTo(view)
            make.width.equalTo(view)
            make.height.equalTo(view)
        }

        titleLabel.snp.makeConstraints {make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.centerX.equalToSuperview()
        }

        nameTextField.snp.makeConstraints {make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }

        passwordTextField.snp.makeConstraints {make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }

        loginButton.snp.makeConstraints {make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(60)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }

        forgotPasswordButton.snp.makeConstraints {make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }

        networksLabel.snp.makeConstraints {make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(150)
            make.left.right.equalToSuperview().inset(40)
        }

        networkHorizantalStack.snp.makeConstraints {make in
            make.top.equalTo(networksLabel.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }

        signUpHorizontalStack.snp.makeConstraints {make in
            make.top.equalTo(networkHorizantalStack.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }

    // MARK: - Action

    @objc private func buttonPressed() {
    }
        
}

//
//  emailCheckViewController.swift
//  FITI-Trainer-iOS
//
//  Created by 박윤빈 on 2023/01/15.
//

import Foundation
import UIKit
import SnapKit

class emailCheckViewController: UIViewController {
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "트레이너 인증"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    private let emailTextField : UITextField = {
        let tf = UITextField()
        
        tf.attributedPlaceholder = NSAttributedString(
                    string: "학교 이메일을 입력해주세요",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.gray)]
                )
        tf.layer.borderColor = UIColor.customColor(.gray).cgColor
        tf.layer.borderWidth = 2
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = UIColor.customColor(.blue)
        tf.setLeftPaddingPoints(10)
        tf.addTarget(self, action: #selector(handleSchoolTfDidChange), for: .editingChanged)
        return tf
    }()
    
    private let authTextField : UITextField = {
        let tf = UITextField()
        tf.isEnabled = false
        tf.attributedPlaceholder = NSAttributedString(
                    string: "인증코드 6자리를 입력해주세요",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
                )
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.borderWidth = 2
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = UIColor.customColor(.blue)
        tf.setLeftPaddingPoints(10)
        tf.addTarget(self, action: #selector(handleMajorTfDidChange), for: .editingChanged)
        return tf
    }()
    
    var progressView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    
    var grayView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    
    let nextButton : UIButton = {
           let btn = UIButton()
            btn.backgroundColor = UIColor.customColor(.gray)
            btn.setTitle("다음", for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            btn.layer.cornerRadius = 10
            btn.addTarget(self, action: #selector(touchNextBtnEvent), for: .touchUpInside)
            return btn
        }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
        
        // Do any additional setup after loading the view.
        setViewHierarchy()
        setConstraints()
        
        self.dismissKeyboard()

    }

    private func setViewHierarchy() {
        
        view.addSubview(titleLabel)
        view.addSubview(progressView)
        progressView.addSubview(grayView)
        view.addSubview(emailTextField)
        view.addSubview(authTextField)
        view.addSubview(nextButton)
    }
    
    private func setConstraints(){
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }
        
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(11)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        grayView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(68)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        authTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
    
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(60)
        }
    
    }
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    var nextBtn = 0
    
    @objc func handleSchoolTfDidChange(_ textField: UITextField) {
        if(emailTextField.text != ""){
            nextButton.backgroundColor = UIColor.customColor(.blue)
            emailTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
        }
        nextBtn = 1
    }
    
    @objc func handleMajorTfDidChange(_ textField: UITextField) {
        if(authTextField.text != ""){
            nextButton.backgroundColor = UIColor.customColor(.blue)
            authTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
            
        }
        nextBtn = 2
    }
    
    @objc func touchNextBtnEvent() {
        print(nextBtn)
        if(nextBtn == 2){
            let nextVC = MakeAccountViewController()
            navigationController?.pushViewController(nextVC, animated: true)
        } else if(nextBtn == 1){
            //major  textField 활성화
            authTextField.isEnabled = true
            authTextField.layer.borderColor = UIColor.customColor(.gray).cgColor
            authTextField.attributedPlaceholder = NSAttributedString(
                        string: "인증코드 6자리를 입력해주세요",
                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.gray)]
                    )
            //버튼 다시 회색으로
            nextButton.backgroundColor = UIColor.customColor(.gray)
    
        }
    }

}


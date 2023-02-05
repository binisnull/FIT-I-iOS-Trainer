//
//  setOpenChatViewController.swift
//  FITI-Trainer-iOS
//
//  Created by 박윤빈 on 2023/02/04.
//

import Foundation
import UIKit
import SnapKit

class setOpenChatViewController: UIViewController {

    var myPageTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 25.0)
        label.text = "오픈 채팅방 링크 첨부"
        label.textColor = UIColor.black
        return label
    }()
    
    var setOpenChatLabel : UILabel = {
        let label = UILabel()
        label.text = "오픈 채팅방 링크"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    private let setOpenChatTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
                    string: "카카오톡 오픈 채팅방 링크를 입력하세요.",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.gray)]
                )
        tf.layer.borderColor = UIColor.customColor(.gray).cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = UIColor.customColor(.blue)
        tf.setLeftPaddingPoints(10)
        tf.addTarget(self, action: #selector(setOpenChatTfDidChange), for: .editingChanged)
        return tf
    }()
    
    let setOpenChatBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.gray)
        btn.setTitle("완료", for: .normal)
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
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
 
        
        setViewHierarchy()
        setConstraints()
        
        self.dismissKeyboard()
    }
    
    func setViewHierarchy(){
        view.addSubview(myPageTitleLabel)
        view.addSubview(setOpenChatLabel)
        view.addSubview(setOpenChatTextField)
        view.addSubview(setOpenChatBtn)
    }
    
    func setConstraints(){
        
        myPageTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        setOpenChatLabel.snp.makeConstraints { make in
            make.top.equalTo(myPageTitleLabel.snp.bottom).offset(59)
            make.leading.equalToSuperview().offset(25)
        }
        
        setOpenChatTextField.snp.makeConstraints { make in
            make.top.equalTo(setOpenChatLabel.snp.bottom).offset(3)
            make.height.equalTo(52)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    
        setOpenChatBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(60)
        }
        
    }
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func touchNextBtnEvent(sender: UIBarButtonItem) {
        if(setOpenChatBtn.backgroundColor == UIColor.customColor(.blue)){
            navigationController?.popViewController(animated: true)
        }
    }

    @objc func setOpenChatTfDidChange() {
        if(setOpenChatTextField.text == ""){
            setOpenChatTextField.layer.borderColor = UIColor.customColor(.gray).cgColor
            setOpenChatBtn.backgroundColor = UIColor.customColor(.gray)
        }else {
            setOpenChatTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
            setOpenChatBtn.backgroundColor = UIColor.customColor(.blue)
        }
    }
}


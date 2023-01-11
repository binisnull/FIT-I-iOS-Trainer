//
//  BodyIntroView.swift
//  FITI-Trainer-iOS
//
//  Created by 박윤빈 on 2023/01/12.
//

import Foundation
import SnapKit
import UIKit

class BodyIntroView : UIView {
    var introImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "introIcon.svg")
        return imgView
    }()
    
    var introLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "소개 글"
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var introTopStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [introImage,introLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .trailing
        return stackView
    }()
    
    var introLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.darkGray)
        return view
    }()
    
    var introTextView : UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.customColor(.boxGray)
        textView.textColor = UIColor.customColor(.darkGray)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 15.0)
        textView.text = "다양한 자격증을 바탕으로 친절하게 지도해드립니다. 스포애니 3년의 경력을 믿어주세요~!"
        return textView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
       
    override init(frame: CGRect) {
        super .init(frame: .zero)

        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy(){
        self.addSubview(introTopStackView)
        self.addSubview(introLineView)
        self.addSubview(introTextView)
        
    }
    
    func setConstraints(){
        introTopStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview().offset(20)
        }
        introLineView.snp.makeConstraints { make in
            make.top.equalTo(introTopStackView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-22)
        }
        introTextView.snp.makeConstraints { make in
            make.top.equalTo(introLineView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(70)
        }
    }
}

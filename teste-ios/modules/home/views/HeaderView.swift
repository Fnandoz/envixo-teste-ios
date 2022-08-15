//
//  HeaderView.swift
//  teste-ios
//
//  Created by Fernando Gomes on 15/08/22.
//

import Tanjiro
import UIKit
class HeaderView: UIView {
    var categoryLabel = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        $0.textColor = UIColor(named: "background_green")
    }
    var seeMoreButton = UIButton().with {
        $0.setTitle("VER MAIS ►", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.setTitleColor(UIColor(named: "gray"), for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        addSubview(categoryLabel)
        addSubview(seeMoreButton)
    }
    func setupConstraints() {
        categoryLabel.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView(8)
            $0.bottom.equalToSuperView()
        }
        seeMoreButton.layout {
            $0.top.equalToSuperView()
            $0.right.equalToSuperView(8)
            $0.bottom.equalToSuperView()
        }
    }
}

//
//  SectionHeaderView.swift
//  teste-ios
//
//  Created by Fernando Gomes on 12/08/22.
//

import UIKit
import Tanjiro
class SectionHeaderView: UICollectionReusableView {
    var titleLabel = UILabel().with {
        $0.tintColor = UIColor(named: "background_green")
//        $0.font = UIFont(name: "", size: <#T##CGFloat#>)
    }
    var seeMoreButton = UIButton().with {
        $0.setTitle("VER MAIS", for: .normal)
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
        addSubview(titleLabel)
        addSubview(seeMoreButton)
    }
    func setupConstraints() {
        titleLabel.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
        }
        seeMoreButton.layout {
            $0.top.equalToSuperView()
            $0.right.equalToSuperView()
        }
    }
    func setupCard(title: String) {
        titleLabel.text = title
    }
}

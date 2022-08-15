//
//  FooterView.swift
//  teste-ios
//
//  Created by Fernando Gomes on 12/08/22.
//

import Tanjiro
import UIKit
protocol FooterViewProtocol {
    func seeMoreAction()
}
class FooterView: UIView {
    var delegate: FooterViewProtocol?
    var image = UIImageView().with {
        $0.image = UIImage(named: "logo-coursify-white")
        $0.contentMode = .scaleAspectFit
    }
    var bodyLabel = UILabel().with {
        $0.textColor = .white
        $0.text = "O Coursify.me é uma plataforma de ensino a distância, onde qualquer pessoa ou empresa pode construir seu EAD e vender cursos pela internet."
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.numberOfLines = 6
    }
    var button = UIButton().with {
        $0.backgroundColor = UIColor(named: "button_orange")
        $0.setTitle("Quero conhecer a plataforma!", for: .normal)
        $0.addTarget(self, action: #selector(seeMoreAction), for: .touchUpInside)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
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
        addSubview(image)
        addSubview(bodyLabel)
        addSubview(button)
        backgroundColor = UIColor(named: "background_green")
    }
    func setupConstraints() {
        image.layout {
            $0.top.equalToSuperView(8)
            $0.height.constraint(equalToConstant: 25)
            $0.centerX.equalToSuperView()
        }
        bodyLabel.layout {
            $0.top.equal(to: image.bottomAnchor, offsetBy: 4)
            $0.centerX.equalToSuperView()
            $0.left.equalToSuperView(40)
            $0.right.equalToSuperView(-40)
        }
        button.layout {
            $0.top.equal(to: bodyLabel.bottomAnchor, offsetBy: 8)
            $0.centerX.equalToSuperView()
            $0.height.constraint(equalToConstant: 30)
            $0.width.constraint(equalToConstant: 200)
            $0.bottom.equalToSuperView(-12)
        }
    }
    @objc func seeMoreAction() {
        delegate?.seeMoreAction()
    }
}

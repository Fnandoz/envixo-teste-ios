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
    
    var view = UIView().with {
        $0.backgroundColor = UIColor(named: "background_green")
    }
    var image = UIImageView().with {
        $0.image = UIImage(named: "logo-coursify-white")
    }
    var bodyLabel = UILabel().with {
        $0.textColor = .white
        $0.text = "O Coursify.me é uma plataforma de ensino a distância, onde qualquer pessoa ou empresa pode construir seu EAD e vender cursos pela internet."
    }
    var button = UIButton().with {
        $0.backgroundColor = UIColor(named: "button_orange")
        $0.setTitle("Quero conhecer a plataforma!", for: .normal)
        $0.addTarget(self, action: #selector(seeMoreAction), for: .touchUpInside)
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
        addSubview(view)
        view.addSubview(image)
        view.addSubview(bodyLabel)
        view.addSubview(button)
    }
    func setupConstraints() {
        image.layout {
            $0.top.equalToSuperView(19)
            $0.height.constraint(equalToConstant: 20)
            $0.centerX.equalToSuperView()
        }
        bodyLabel.layout {
            $0.top.equal(to: image.bottomAnchor, offsetBy: 11)
            $0.centerX.equalToSuperView()
        }
        button.layout {
            $0.top.equal(to: bodyLabel.bottomAnchor, offsetBy: 28)
            $0.centerX.equalToSuperView()
            $0.height.constraint(equalToConstant: 44)
        }
    }
    @objc func seeMoreAction() {
        delegate?.seeMoreAction()
    }
}

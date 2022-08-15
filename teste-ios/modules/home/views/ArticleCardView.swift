//
//  ArticleCardView.swift
//  teste-ios
//
//  Created by Fernando Gomes on 12/08/22.
//

import UIKit
import Tanjiro
import SkeletonView
class ArticleCardView: UICollectionViewCell {
    var articleId: Int?
    static var reuseIdentifier = "ArticleCardViewReuseIdentifier"
    var imageView = UIImageView().with {
        $0.isSkeletonable = true
    }
    var titleLabel = UILabel().with {
        $0.textColor = .black
        $0.isSkeletonable = true
        $0.numberOfLines = 2
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    var descriptionLabel = UILabel().with {
        $0.isSkeletonable = true
        $0.textColor = .black
        $0.numberOfLines = 4
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    }
    var readMoreButton = UIButton().with {
        $0.setTitle("Leia mais", for: .normal)
        $0.tintColor = UIColor.orange
        $0.isSkeletonable = true
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
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
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(readMoreButton)
        layer.cornerRadius = 12
        layer.masksToBounds = true
    }
    func setupConstraints() {
        imageView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.height.constraint(equalToConstant: 60)
        }
        titleLabel.layout {
            $0.top.equal(to: imageView.bottomAnchor, offsetBy: 10)
            $0.left.equalToSuperView(9)
            $0.right.equalToSuperView(39)
        }
        descriptionLabel.layout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: 12)
            $0.left.equalToSuperView(10)
            $0.right.equalToSuperView(2)
        }
        readMoreButton.layout {
            $0.top.equal(to: descriptionLabel.bottomAnchor, offsetBy: 12)
            $0.left.equalToSuperView(10)
            $0.bottom.equalToSuperView(-35)
        }
    }
    func setupCard(imageId: Int, title: String, description: String, articleId: Int) {
        imageView.image = UIImage(systemName: "photo")
        titleLabel.text = title
        descriptionLabel.text = description
        self.articleId = articleId
    }
    
}

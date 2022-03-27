//
//  CategoryCollectionViewCell.swift
//  Zand
//
//  Created by Kostya Lee on 25/03/22.
//

import UIKit

// Клетка отображающая категорию
class CategoryCollectionViewCell: UICollectionViewCell {
    
        var CustomImageView = UIImageView()
        static let identifier = "CategoryCell"
    
        func setupImageView() {
            addSubview(CustomImageView)
            CustomImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            CustomImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            CustomImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            CustomImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            self.CustomImageView.contentMode = .scaleAspectFit
            self.layer.accessibilityPath?.stroke(with: .color, alpha: 1)
            self.tintColor = .systemGray
        }

        required init?(coder: NSCoder) {
            fatalError("Init(coder:) has not been implemented")
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            CustomImageView.frame = contentView.bounds
        }

        override func prepareForReuse() {
            super.prepareForReuse()
            CustomImageView.image = nil
        }

}


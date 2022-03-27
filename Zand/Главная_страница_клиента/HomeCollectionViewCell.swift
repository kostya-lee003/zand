//
//  HomeCollectionViewCell.swift
//  Zand
//
//  Created by Kostya Lee on 25/03/22.
//

import UIKit

// Клетка отображающая пост
class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
//    func configure(with urlString: String) {
//
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//
//            guard let data = data else {
//                return
//            }
//
//            DispatchQueue.main.async {
//                let image = UIImage(data: data)
//                self?.imageView.image = image
//            }
//        }.resume()
//    }
}

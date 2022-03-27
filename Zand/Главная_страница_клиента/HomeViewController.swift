//
//  ScissorsViewController.swift
//  Zand
//
//  Created by Kostya Lee on 13/03/22.
//

/*
 MARK: Документация
 18) Это посты сделанные мастерами и салонами которые попались в рекоммендации нашему пользователю
 36) Метод createLayout это метод возвращающий нам необходимый спецефичный collection view layout. Спецефичный лэйаут состоит из горизонтального скроллинга категории(17) и чуть ниже вертикального скроллинга постов(18)
 150) Метод отвечающий за действие которое происходит когда нажата кнопка "сортировать"
 157) Расширение (extension) которое отвечает за конфигурацию collection view
 */


import UIKit
import LBTATools

// MARK: Главная страница
class HomeViewController: UICollectionViewController {
    
    // Поисковое поле
    let searchController = UISearchController(searchResultsController: nil)
    
    private let categories = ["Маник", "Брови", "Ресницы", "Эпиляция"]
    private let results = ["1", "2", "3", "4", "5", "6", "7", "8"]
    
    init() {
        super.init(collectionViewLayout: HomeViewController.createLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        setupSearchController()
        view.backgroundColor = .systemBackground
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                item.contentInsets.trailing = 20
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(0.365),
                        heightDimension: .fractionalWidth(0.31)),
                    subitems: [item]
                )
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 20
                
                section.orthogonalScrollingBehavior = .continuous
                return section
            } else {
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(0.5),
                        heightDimension: .fractionalWidth(0.7)
                    )
                )
                
                let screenHeight = UIScreen.main.bounds.height
                if UIScreen.main.bounds.height <= 736.0 {
                    item.contentInsets.bottom = screenHeight * 0.09
                } else {
                    item.contentInsets.bottom = screenHeight * 0.022
                }
                
                item.contentInsets.trailing = 10
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(0.3)),
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 40,
                                              leading: 14,
                                              bottom: 0,
                                              trailing: 5)
                return section
            }
        }
        layout.configuration.scrollDirection = .vertical
        return layout
    }
    
    private func setupSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupNavigationBar() {
        
        let rightButton = UIButton(frame: CGRect(x: self.view.frame.width, y: -35, width: 100, height: 100))
        rightButton.setBackgroundImage(UIImage(named: "sortButton"), for: .normal)
        rightButton.tintColor = .gray
        rightButton.addTarget(self, action: #selector(didPressSortButton), for: .touchUpInside)
        navigationController?.navigationBar.addSubview(rightButton)

        let targetView = self.navigationController?.navigationBar

        let trailingContraint = NSLayoutConstraint(
            item: rightButton,
            attribute: .trailingMargin,
            relatedBy: .equal,
            toItem: targetView,
            attribute: .trailingMargin,
            multiplier: 1.0,
            constant: -16 )
        let bottomConstraint = NSLayoutConstraint(
            item: rightButton,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: targetView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: -62)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([trailingContraint, bottomConstraint])
        
        navigationItem.title = "ZAND"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: HomeViewController.createLayout())
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    @objc func didPressSortButton() {
        print("Sort")
    }
    
}


extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? categories.count : results.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.backgroundColor = .gray
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = .blue
            return cell
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("selected category")
        } else {
            print("Selected post")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader {
                sectionHeader.sectionHeaderlabel.text = "Section \(indexPath.section)"
                return sectionHeader
            }
        return UICollectionReusableView()
    }
}

class SectionHeader: UICollectionReusableView {
    var sectionHeaderlabel: UILabel!
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            sectionHeaderlabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            sectionHeaderlabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            sectionHeaderlabel.topAnchor.constraint(equalTo: self.topAnchor),
            sectionHeaderlabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(sectionHeaderlabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

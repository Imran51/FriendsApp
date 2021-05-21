//
//  ViewController.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit



class FriendsViewController: UIViewController {
    
    var viewModel: FriendsViewControllerToViewModel?
    
    private var friendList = [FriendsInfo]()
    
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    private let itemsPerRow: CGFloat = 3
    private let cellHeight: CGFloat = 190
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(FriendsViewCollectionViewCell.self, forCellWithReuseIdentifier: FriendsViewCollectionViewCell.identifier)
        collection.backgroundColor = .white
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel?.fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = view.bounds
    }
}

extension FriendsViewController: FriendsViewModelToViewController {
    func updateView(for data: [FriendsInfo]) {
        DispatchQueue.main.async { [weak self] in
            self?.friendList = data
            self?.collectionView.reloadData()
        }
    }
    
    func showError(for error: String) {
        print(error)
    }
}

extension FriendsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        friendList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsViewCollectionViewCell.identifier, for: indexPath) as? FriendsViewCollectionViewCell else {
            return UICollectionViewCell()
        }
        let friendInfo = friendList[indexPath.item]
        
        guard let imageUrl = URL(string: friendInfo.picture.medium) else {
            return UICollectionViewCell()
        }
        
        let viewModel = FriendsViewCollectionViewCellModel(imageUrl: imageUrl, name: friendInfo.name, country: friendInfo.location.country)
        
        cell.configure(with: viewModel)
        cell.backgroundColor = .white
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let friendInfo = friendList[indexPath.item]
        guard let nav = self.navigationController else { return }
        viewModel?.showDetailView(from: nav, withData: friendInfo)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        // 2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: cellHeight)
    }
    
    // 3
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return sectionInsets.left
    }
}


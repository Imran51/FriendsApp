//
//  FriendsDetailViewController.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

class FriendsDetailViewController: UIViewController {
    var viewModel: FriendsDetailViewControllerToViewModel?
    
    private let imageView = CustomImageView()
    
    private var detailInfo: FriendsInfo?
    
    private let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .black
        
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(containerView)
        containerView.addSubview(imageView)
        guard let picture = detailInfo?.picture, let imageUrl = URL(string: picture.large) else {
            return
        }
        
        imageView.loadImageWithUrl(imageUrl)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        containerView.frame = CGRect(x: 0, y: 150, width: view.frame.width, height: 210)
        imageView.frame = CGRect(x: containerView.frame.width/2-100, y: 0, width: 200, height: 200)
        imageView.round(cornerRadius: 100, borderColor: .white)
    }
}

extension FriendsDetailViewController: FriendsDetailViewModelToViewController {
    func updateView(for data: FriendsInfo) {
        detailInfo = data
    }
}


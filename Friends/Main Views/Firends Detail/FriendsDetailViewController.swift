//
//  FriendsDetailViewController.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

class FriendsDetailViewController: UIViewController {
    
    struct LabelConstant {
        static let fullName = "Full Name: "
        static let email = "Email: "
        static let city = "City: "
        static let state = "State: "
        static let country = "Country: "
        static let cellPhone = "Cell Phone: "
    }
    
    var viewModel: FriendsDetailViewControllerToViewModel?
    
    private var detailInfo: FriendsInfo?
    
    private let imageView = CustomImageView()

    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.isScrollEnabled = true
        scroll.alwaysBounceHorizontal = false
        scroll.alwaysBounceVertical = true
        scroll.backgroundColor = .clear

        return scroll
    }()
    
    private let verticalContainerStackView: UIStackView = {
        let stack = ViewUtils.customStackview(withSpacing: 5, withAxis: .vertical)
        

        return stack
    }()

    private let containerView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.heightAnchor.constraint(equalToConstant: 210).isActive = true

        return container
    }()

    private let fullNameLabel = ViewUtils.customLabel(background: .clear, alignment: .center, height: 60)
    private let cityLabel = ViewUtils.customLabel()
    private let stateLabel = ViewUtils.customLabel()
    private let countryLabel = ViewUtils.customLabel()
    private let emailLabel = ViewUtils.customLabel()
    private let cellPhoneLabel = ViewUtils.customLabel()
    private let verticalSpacerView = ViewUtils.verticalSpacerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hexString: "#d8dbe2")
        addUIElementToMainView()
        setupViewElementsContaints()
        initializeViewData()
        configureViewData()
        addActionToEmailClick()
    }
    
    private func addActionToEmailClick() {
        verticalContainerStackView.isUserInteractionEnabled = true
        emailLabel.isUserInteractionEnabled = true
        emailLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openEmail(_:))))
    }
    
    @objc private func openEmail(_ sender: UITapGestureRecognizer) {
        if let email = detailInfo?.email ,let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
    private func initializeViewData() {
        guard let picture = detailInfo?.picture, let imageUrl = URL(string: picture.large) else {
            return
        }
        imageView.loadImageWithUrl(imageUrl)
    }
    
    private func addUIElementToMainView() {
        view.addSubview(scrollView)
        scrollView.addSubview(verticalContainerStackView)
        verticalContainerStackView
            .addArrangedSubViews(
                containerView,
                fullNameLabel,
                emailLabel,
                cityLabel,
                stateLabel,
                countryLabel,
                cellPhoneLabel,
                verticalSpacerView
            )
        containerView.addSubview(imageView)
    }
    
    private func setupViewElementsContaints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        verticalContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            verticalContainerStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            verticalContainerStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            verticalContainerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            verticalContainerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            verticalContainerStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        verticalContainerStackView.isLayoutMarginsRelativeArrangement = true
        verticalContainerStackView.layoutMargins = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        
        imageView.round(cornerRadius: 100, borderColor: .white)
        fullNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    private func configureViewData() {
        guard let info = detailInfo else {
            return
        }
        
        let fullName = info.name.title + " " + info.name.first + " " + info.name.last
        fullNameLabel.text = fullName
        
        emailLabel.attributedText = getAttributedString(title: LabelConstant.email, text: info.email, textFontColor: .link)
        
        cityLabel.attributedText = getAttributedString(title: LabelConstant.city, text: info.location.city)
        stateLabel.attributedText = getAttributedString(title: LabelConstant.state, text: info.location.state)
        countryLabel.attributedText = getAttributedString(title: LabelConstant.country, text: info.location.country)
        cellPhoneLabel.attributedText = getAttributedString(title: LabelConstant.cellPhone , text: info.cell)
        
    }
    
    private func getAttributedString(title: String, text: String, textFontColor: UIColor = .label) -> NSMutableAttributedString {
        let fontSize: CGFloat = 20
        return NSMutableAttributedString().formatFontWeight(title, isStringBold: true, withFonSize: fontSize).formatFontWeight(text,withFonSize: fontSize, withFontColor: textFontColor)
    }
}

extension FriendsDetailViewController: FriendsDetailViewModelToViewController {
    func updateView(for data: FriendsInfo) {
        detailInfo = data
    }
}

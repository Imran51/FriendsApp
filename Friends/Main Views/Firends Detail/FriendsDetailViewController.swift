//
//  FriendsDetailViewController.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

class FriendsDetailViewController: UIViewController {
    var viewModel: FriendsDetailViewControllerToViewModel?
    
    private let imageView: CustomImageView = {
        let image = CustomImageView()
        
        return image
    }()
    
    private var detailInfo: FriendsInfo?
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.isScrollEnabled = true
        scroll.alwaysBounceHorizontal = false
        scroll.alwaysBounceVertical = true
        
        return scroll
    }()
    
    private let verticalContainerStackView: UIStackView = {
        let stack = ViewUtils.customStackview(withSpacing: 5, withAxis: .vertical)
        stack.backgroundColor = UIColor(hexString: "#d8dbe2")
        
        return stack
    }()
    
    private let containerView: UIView = {
        let container = UIView()
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
        
        view.backgroundColor = .white
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
        guard let picture = detailInfo?.picture, let imageUrl = URL(string: picture.large) else {
            return
        }
        
        imageView.loadImageWithUrl(imageUrl)
        configureViewData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        verticalContainerStackView.frame = scrollView.frame
        verticalContainerStackView.isLayoutMarginsRelativeArrangement = true
        verticalContainerStackView.layoutMargins = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 10)
        imageView.frame = CGRect(x: verticalContainerStackView.frame.width/2-100, y: 0, width: 200, height: 200)
        
        imageView.round(cornerRadius: 100, borderColor: .white)
        fullNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    struct LabelConstant {
        static let fullName = "Full Name: "
        static let email = "Email: "
        static let city = "City: "
        static let state = "State: "
        static let country = "Country: "
        static let cellPhone = "Cell Phone: "
    }
    
    private func configureViewData() {
        guard let info = detailInfo else {
            return
        }
        
        let fullName = info.name.title + " " + info.name.first + " " + info.name.last
        fullNameLabel.text = fullName
        
        emailLabel.attributedText = getAttributedString(title: LabelConstant.email, text: info.email)
        
        cityLabel.attributedText = getAttributedString(title: LabelConstant.city, text: info.location.city)
        stateLabel.attributedText = getAttributedString(title: LabelConstant.state, text: info.location.state)
        countryLabel.attributedText = getAttributedString(title: LabelConstant.country, text: info.location.country)
        cellPhoneLabel.attributedText = getAttributedString(title: LabelConstant.cellPhone , text: info.cell)
        
    }
    
    private func getAttributedString(title: String, text: String) -> NSMutableAttributedString {
        return NSMutableAttributedString().formatFontWeight(title, isStringBold: true, 18).formatFontWeight(text)
    }
    
    private func getSeparator() -> UIView {
        return ViewUtils.verticalSeparatorView()
    }
}

extension FriendsDetailViewController: FriendsDetailViewModelToViewController {
    func updateView(for data: FriendsInfo) {
        detailInfo = data
    }
}

extension NSMutableAttributedString {

    func formatFontWeight(_ value: String, isStringBold stringBold: Bool = false, _ fontSize: CGFloat = 17, _ fontColor: UIColor = .label, isItalicStyleEnabled italicStyleEnabled:Bool = false) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key: Any] = [:]
        let font = stringBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        attributes = [.font: (italicStyleEnabled ? font.italics() : font), .foregroundColor: fontColor]

        self.append(NSAttributedString(string: value, attributes: attributes))

        return self
    }
}


extension UIFont{
    fileprivate func withTraits(_ traits: UIFontDescriptor.SymbolicTraits) -> UIFont {

        // create a new font descriptor with the given traits
        guard let fd = fontDescriptor.withSymbolicTraits(traits) else {
            // the given traits couldn't be applied, return self
            return self
        }

        // return a new font with the created font descriptor
        return UIFont(descriptor: fd, size: pointSize)
    }

    func italics() -> UIFont {
        return withTraits(.traitItalic)
    }

    func bold() -> UIFont {
        return withTraits(.traitBold)
    }

    func boldItalics() -> UIFont {
        return withTraits([ .traitBold, .traitItalic ])
    }
}

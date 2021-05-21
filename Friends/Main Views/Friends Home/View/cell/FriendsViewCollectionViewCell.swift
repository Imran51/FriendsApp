//
//  FriendsViewCollectionViewCell.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

struct FriendsViewCollectionViewCellModel {
    let imageUrl: URL
    let name: NameInfo
    let country: String
}

class FriendsViewCollectionViewCell: UICollectionViewCell {
    static let identifier = "FriendsViewCollectionViewCell"
    
    private let imageParentView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        // Top right corner, Top left corner respectively
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return view
    }()
    
    private let imageView: CustomImageView = {
        let image = CustomImageView()
        
        
        return image
    }()
    
    private let parentView: CardView = {
        let view = CardView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private let nameContainerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .top
        stack.distribution = .fill
        stack.spacing = 1
        
        return stack
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .label
        label.text = "Full Name:"
        label.numberOfLines = 1
        label.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        return label
    }()
    
    private let nameLabelText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 2
        label.textAlignment = .left
        
        return label
    }()
    
    private let countryContainerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .top
        stack.distribution = .fill
        stack.spacing = 1
        
        return stack
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .label
        label.text = "Country:"
        label.numberOfLines = 1
        label.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        return label
    }()
    
    private let countryLabelText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 1
        label.textAlignment = .left
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(parentView)
        imageParentView.addSubview(imageView)
        parentView.addSubview(imageParentView)
        
        parentView.addSubview(nameContainerStackView)
        nameContainerStackView.addArrangedSubview(nameLabel)
        nameContainerStackView.addArrangedSubview(nameLabelText)
        
        parentView.addSubview(countryContainerStackView)
        countryContainerStackView.addArrangedSubview(countryLabel)
        countryContainerStackView.addArrangedSubview(countryLabelText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        parentView.frame = contentView.bounds
        imageParentView.frame = CGRect(x: 0, y: 0, width: parentView.frame.width, height: 95)
        imageView.frame = CGRect(x: imageParentView.frame.width/2-40, y: 5, width: 80, height: 80)
        imageView.round(cornerRadius: 40, borderColor: .white)
        
        nameContainerStackView.frame = CGRect(x: 10, y: 105, width: parentView.frame.width-20, height: 40)
        countryContainerStackView.frame = CGRect(x: 10, y: 145, width: parentView.frame.width-10, height: 40)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        nameLabelText.text = nil
        countryLabelText.text = nil
    }
    
    func configure(with viewModel: FriendsViewCollectionViewCellModel){
        imageView.loadImageWithUrl(viewModel.imageUrl)
        nameLabelText.text = viewModel.name.title + " " + viewModel.name.first + " " + viewModel.name.last
        countryLabelText.text = viewModel.country
    }
}


extension NSMutableAttributedString {
    
    func formatFontWeight(_ value: String, isStringBold stringBold: Bool, _ fontSize: CGFloat = 18, _ fontColor: UIColor = UIColor.black, isItalicStyleEnabled italicStyleEnabled:Bool = false) -> NSMutableAttributedString {
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


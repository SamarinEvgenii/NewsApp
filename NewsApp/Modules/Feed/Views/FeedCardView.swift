//
//  FeedCardView.swift
//  NewsApp
//
//  Created by Евгений Самарин on 12.02.2021.
//

import UIKit

class FeedCardView: UIView {
    
    private let infoLabel = UILabel()
    private let titleLabel = UILabel()
    private let shortDescriptionLabel = UILabel()
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imageView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.infoLabel)
        self.addSubview(self.shortDescriptionLabel)
        
        self.infoLabel.numberOfLines = 1 // По умолчанию вроде тоже 1 строка, но пусть будет)))
        self.titleLabel.numberOfLines = 3
        self.shortDescriptionLabel.numberOfLines = 2
        
        
        self.infoLabel.textColor = .white
        self.titleLabel.font = Font.system(ofSize: 32, weight: .bold)
        self.titleLabel.textColor = .white
        
        self.shortDescriptionLabel.font = Font.system(ofSize: 18, weight: .regular)
        self.shortDescriptionLabel.textColor = UIColor.rgba(158, 158, 158)
    }
    
    override required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let maxLabelWidth = self.frame.width - Constants.margin * 2
        let maxLabelSize = CGSize(width: maxLabelWidth, height: .greatestFiniteMagnitude)
        let titleLabelSize = self.titleLabel.sizeThatFits(maxLabelSize)
        
        let infoLabelSize = self.infoLabel.sizeThatFits(maxLabelSize)
        self.infoLabel.frame.origin = CGPoint(x: Constants.margin, y: Constants.margin)
        self.infoLabel.frame.size = infoLabelSize
        
        let shortDescriptionSize = self.shortDescriptionLabel.sizeThatFits(maxLabelSize)
        let shortDescriptionOrigin = CGPoint(x: Constants.margin, y: self.frame.height - shortDescriptionSize.height)
        self.shortDescriptionLabel.frame.origin = shortDescriptionOrigin
        self.shortDescriptionLabel.frame.size = shortDescriptionSize

        let titleLabelOrigin = CGPoint(x: Constants.margin, y: shortDescriptionLabel.frame.minY - Constants.margin - titleLabelSize.height)
        self.titleLabel.frame.origin = titleLabelOrigin
        self.titleLabel.frame.size = titleLabelSize
        
        self.imageView.frame = self.frame
    }
    
    func updateCard(with viewModel: FeedCardViewModel) {
        self.infoLabel.text = viewModel.info
        self.titleLabel.text = viewModel.title
        self.shortDescriptionLabel.text = viewModel.shortDescriprion
        self.imageView.image = UIImage(named: viewModel.imageName)
        self.setNeedsLayout()
        
    }
}


private struct Constants {
    static let margin: CGFloat = 16
}

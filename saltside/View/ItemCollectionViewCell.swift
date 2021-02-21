//
//  ItemCollectionViewCell.swift
//  saltside
//
//  Created by Siddhesh Redkar on 21/02/21.
//  Copyright © 2021 Siddhesh Redkar. All rights reserved.
//

import UIKit
import SDWebImage

class ItemCollectionViewCell: UICollectionViewCell {
    
    var itemDetails:ItemDetail?{
        didSet{
            if let title = itemDetails?.title{
                titleLabel.text = title
            }
            if let discription = itemDetails?.description{
                discriptionLabel.text = discription
            }
            if let imageUrl = itemDetails?.image{
                //Background image download
                print(imageUrl)
                imgView.sd_setImage(with: URL(string:imageUrl), placeholderImage: Images.placeholderImage)
            }
        }
    }
    
    let outerView: CardView = {
        let view = CardView()
        view.backgroundColor = .white
        view.cornerRadius = 8
        return view
    }()
    
    let hStackView:UIStackView = {
        let stack = UIStackView()
        stack.axis          = .horizontal
        stack.distribution  = .equalSpacing
        stack.spacing = 12
        return stack
    }()
    
    let labelStackView:UIStackView = {
        let stack = UIStackView()
        stack.axis          = .vertical
        stack.distribution  = .equalSpacing
        stack.spacing = 2
        return stack
    }()
    
    let imgView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.borderColor = UIColor(red: 230/255, green: 230/255, blue:230/255, alpha: 1).cgColor
        img.layer.borderWidth = 0.5
        img.layer.cornerRadius = 8
        img.image = UIImage(named: "boost-your-gym")
        return img
    }()
    
    let backView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 8
        // v.alpha = 0.5
        return v
    }()
    
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        lbl.text = "terminations map autos sons utilizations"
        return lbl
    }()
    
    var discriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.text = "sterilizer span ticks continuity hubs procurement vision eggs backups cries gap iron conferences torpedo government catchers restaurant destroyers attribute counsel echo overcurrent classes trip environments forecastle giants conspiracies suppression things rope plans bow blots rescuers incline"
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
        layoutUI()
    }
    
    private func configureStackView(){
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(discriptionLabel)
        
        hStackView.addArrangedSubview(backView)
        hStackView.addArrangedSubview(labelStackView)
    }
    private func layoutUI() {
        addSubviews(outerView)
        outerView.addSubview(hStackView)
        backView.addSubview(imgView)
        imgView.pinToEdges(of: backView)
        outerView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            outerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            outerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            outerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -0),
            outerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -0),
            
            hStackView.topAnchor.constraint(equalTo: outerView.topAnchor, constant: padding),
            hStackView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor, constant: padding),
            hStackView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor, constant: -padding),
            hStackView.bottomAnchor.constraint(equalTo: outerView.bottomAnchor, constant: -padding),
            
            backView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

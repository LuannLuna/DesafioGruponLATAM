//
//  TravelTableViewCell.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

    private let lbName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private let ivThumb: UIImageView = {
        let ui = UIImageView()
        ui.contentMode = .scaleAspectFill
        ui.clipsToBounds = true
        return ui
    }()
    
    private let lbApartir: UILabel = {
        let lbl = UILabel()
        lbl.text = "A partir de"
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 13)
        return lbl
    }()
    
    private let lbRS: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red:0.96, green:0.28, blue:0.00, alpha:1.0)
        lbl.text = "R$"
        lbl.font = UIFont.systemFont(ofSize: 13)
        return lbl
    }()
    
    private let lbValue: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red:0.96, green:0.28, blue:0.00, alpha:1.0)
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        return lbl
    }()
    
    private let lbDesc: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private let favButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = #imageLiteral(resourceName: "like")
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(ivThumb)
        addSubview(lbName)
        addSubview(lbApartir)
        addSubview(lbRS)
        addSubview(lbValue)
        addSubview(lbDesc)
        addSubview(favButton)
        
        let stackViewPrice = UIStackView(arrangedSubviews: [lbRS,lbValue])
        stackViewPrice.distribution = .fill
        stackViewPrice.axis = .horizontal
        stackViewPrice.spacing = 0
        addSubview(stackViewPrice)
        
        let stackView = UIStackView(arrangedSubviews: [lbApartir,stackViewPrice])
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
        addSubview(stackView)
        
        ivThumb.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 165, enableInsets: false)
//        stackView.anchor(top: ivThumb.bottomAnchor, left: lbName.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 15, width: 0, height: 0, enableInsets: false)
        
//        lbName.anchor(top: ivThumb.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: stackView.leadingAnchor, paddingTop: 5, paddingLeft: 15, paddingBottom: 5, paddingRight: 10, width: 0, height: 0, enableInsets: false)
//        favButton.anchor(top: nil, left: lbDesc.rightAnchor, bottom: ivThumb.bottomAnchor, right: lbDesc.leftAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 15, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        lbDesc.anchor(top: nil, left: leftAnchor, bottom: ivThumb.bottomAnchor, right: leftAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 15, paddingRight: 50, width: 0, height: 0, enableInsets: false)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(with deal: Deal) {
        lbName.text = deal.title
        lbDesc.text = deal.short_title
        lbValue.text = String(format: "%.2f", deal.sale_price)
        
        let url = URL(string: deal.dealImage)
        let data = try? Data(contentsOf: url!)
        ivThumb.image = UIImage(data: data!)
    }

}

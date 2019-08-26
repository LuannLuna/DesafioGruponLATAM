//
//  ComponentTableViewCell.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class ComponentTableViewCell: UITableViewCell {
    static let identifier = "ComponentTableViewCell"

    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    
    @IBOutlet weak var cicleView: UIView!
    @IBOutlet weak var viEffect: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cicleView.layer.cornerRadius = cicleView.bounds.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with deal: Deal) {
        lbName.text = deal.ultra_brief_description
        lbDescription.text = deal.title
        lbPrice.text = String(format: "%.2f", deal.sale_price)
        
        let url = URL(string: deal.dealImage)
        let data = try? Data(contentsOf: url!)
        ivThumb.image = UIImage(data: data!)
    }

}

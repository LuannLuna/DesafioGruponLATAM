//
//  BannerCollectionViewCell.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ivBanner: UIImageView!
    
    func prepare(with banner: Banner) {
        
        let url = URL(string: banner.mobile.mobile_image)
        let data = try? Data(contentsOf: url!)
        ivBanner.image = UIImage(data: data!)
    }
}

//
//  CircleCollectionViewCell.swift
//  TheBigBangTheory
//
//  Created by Maysa on 17/07/21.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var CircleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.CircleImageView.circleImage()
    }

    func setup(value: Personagens) {
        
        self.CircleImageView.image = UIImage(named: value.imageName)
    }
    
}

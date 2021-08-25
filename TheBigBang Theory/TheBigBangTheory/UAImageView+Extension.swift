//
//  UAImageView+Extension.swift
//  TheBigBangTheory
//
//  Created by Maysa on 18/07/21.
//

import Foundation
import UIKit


extension UIImageView {
    
    func circleImage(borderColor: UIColor? = .gray, borderWidth: CGFloat? = 2.5) {
        
        self.layer.cornerRadius = 0.2 * self.bounds.size.width
        self.clipsToBounds = true
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth ?? 0
    }
    
    
    func circleImage(borderColor: UIColor, borderWidth: CGFloat) {
        
        self.layer.cornerRadius = 0.2 * self.bounds.size.width
        self.clipsToBounds = true
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    
}

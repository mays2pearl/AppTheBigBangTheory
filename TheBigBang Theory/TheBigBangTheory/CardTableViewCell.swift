//
//  CardTableViewCell.swift
//  TheBigBangTheory
//
//  Created by Maysa on 18/07/21.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var perfilImageView: UIImageView!
    
    @IBOutlet weak var cardBackgroundImageView: UIImageView!
    
    @IBOutlet weak var nomeLabel: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func  setup(value: Personagens) {
        
        self.perfilImageView.circleImage()
        self.cardBackgroundImageView.image = UIImage(named: value.imageNameBackground)
        self.perfilImageView.image = UIImage(named: value.imageName)
        self.nomeLabel.text = String?(value.nome)
    
    }

    @IBAction func tappedMyButton(_ sender: UIButton) {
        
        print("botao Clicado")
    }
    
}

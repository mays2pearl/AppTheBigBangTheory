//
//  DetailViewController.swift
//  TheBigBangTheory
//
//  Created by Maysa on 23/07/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var nomeLabel: UILabel!
    
    
    @IBOutlet weak var descricaoTextView: UITextView!

    
    var personagemSelecionado: Personagens?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailImageView.image = UIImage(named: self.personagemSelecionado?.imageName ?? "")
        self.nomeLabel.text = self.personagemSelecionado?.nome
        self.descricaoTextView.text = self.personagemSelecionado?.descricao
        

        // Do any additional setup after loading the view.
      
    }
    


}

//
//  horizontalTableViewCell.swift
//  TheBigBangTheory
//
//  Created by Maysa on 17/07/21.
//

import UIKit

protocol horizontalTableViewCellProtocol: AnyObject {
    
    func didSelectPersonagens(value: Personagens)
}

class horizontalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var horizontalColletionView: UICollectionView!
    
    private var arrayPersonagens:[Personagens] = []

    weak var delegate: horizontalTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.horizontalColletionView.register(UINib(nibName: "CircleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CircleCollectionViewCell")
        
        self.horizontalColletionView.dataSource = self
        self.horizontalColletionView.delegate = self
    }
    
    func setup(value: [Personagens]) {
        
        self.arrayPersonagens = value
        self.horizontalColletionView.reloadData()
    }
    
}

extension horizontalTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrayPersonagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CircleCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "CircleCollectionViewCell", for: indexPath) as? CircleCollectionViewCell
        
        cell?.setup(value: self.arrayPersonagens[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("horizontalTableViewCell=====didSelectItemAt====\n \(self.arrayPersonagens[indexPath.row])")
        
        self.delegate?.didSelectPersonagens(value: self.arrayPersonagens[indexPath.row])
    }
    
}



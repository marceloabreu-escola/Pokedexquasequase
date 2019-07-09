//
//  pokemonCollectionViewCell.swift
//  PokedexMarcelo
//
//  Created by Aluno_Istec on 09/07/2019.
//  Copyright © 2019 Marcelo Abreu. All rights reserved.
//

import UIKit

class pokemonCollectionViewCell: UICollectionViewCell  {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagemCell: UIImageView!
    
    func setPokemonOnLayOut(pokemon: Pokemon){
        
        imagemCell.image = pokemon.imagePoke
        nameLabel.text = pokemon.namePoke
        
    }
    
    
    
    
    
}

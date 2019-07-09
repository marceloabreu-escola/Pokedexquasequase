//
//  ListarPokemonViewController.swift
//  PokedexMarcelo
//
//  Created by Marcelo Abreu on 27/06/2019.
//  Copyright © 2019 Marcelo Abreu. All rights reserved.
//

import UIKit

class ListarPokemonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
    
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    public var pokemon = [Pokemon]()
    public var imagemCell: UIImage!
    
    //Array para receber Pokemons
    //
    //
    static var GuardarPokemon: [Pokemon] = []
    
    func adicionarPokemon() -> [Pokemon]{
        
        var addPokemons : [Pokemon] = []
        
        let first = Pokemon(imagem: UIImage(named:"Pikachu")!, name: "Pikachu", type: "Electric", subType: "Normal", description: "Cute and Funny", xp: 12, hp: 50, power: 25, evolution: "Raichu")
        
        //First Pokemon
        if ListarPokemonViewController.GuardarPokemon.indices.contains(0)
        {
            if ListarPokemonViewController.GuardarPokemon[0].namePoke != "Pikachu"
            {
                return addPokemons
            }
            if first.namePoke ==  ListarPokemonViewController.GuardarPokemon[0].namePoke
            {
                return addPokemons
            }
        }
        
        
        addPokemons.append(first)
        
        
        return addPokemons
    }
    //
    //
    //
    
    public var filteredPokemon = [Pokemon]()
    public var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ListarPokemonView has loaded!")
        
        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //collection view functions
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            
            let content = ListarPokemonViewController.GuardarPokemon[indexPath.row]
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as! pokemonCollectionViewCell
            
            cell.setPokemonOnLayOut(pokemon: content)
            
            return cell
            //let poke: Pokemon!
            
            //if(inSearchMode){
                
                //poke = filteredPokemon[indexPath.row]
                //cell.configureCell(pokemon: poke)
                
            //} else {
                
                //poke = pokemon[indexPath.row]
                //cell.configureCell(pokemon: poke)
                
            //}
            
            //eturn cell
            
        //} else {
            
            //return UICollectionViewCell()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //var poke: Pokemon!
        
        if(inSearchMode){
            
            //poke = filteredPokemon[indexPath.row]
            
        } else {
            
            //poke = pokemon[indexPath.row]
        }
        
        //performSegue(withIdentifier: "PokemonDetailSegue", sender: poke)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (inSearchMode){
            
            //return filteredPokemon.count
            
        }
        
        return ListarPokemonViewController.GuardarPokemon.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 120, height: 121)
    }
    
    //search bar functions
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == ""{
            inSearchMode = false
            collection.reloadData()
        } else {
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            
            filteredPokemon = pokemon.filter({$0.namePoke.range(of: lower) != nil})
            collection.reloadData()
        }
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailSegue"{
            if let detailsViewController = segue.destination as? PokemonDetailViewController{
                if let poke = sender as? Pokemon{
                    detailsViewController.pokemon = poke
                }
            }
        }
    }
    
}



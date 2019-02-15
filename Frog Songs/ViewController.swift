//
//  ViewController.swift
//  Frog Songs
//
//  Created by Chris Nielubowicz on 2/9/19.
//  Copyright © 2019 nielubowicz. All rights reserved.
//

import UIKit

class FrogCollectionViewCell: UICollectionViewCell {
    @IBOutlet var name: UILabel!
    
    func configure(with frog: Frog) {
        name.text = frog.name
    }
}

class ViewController: UICollectionViewController {

    var frogs: [Frog] = [Frog]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            self.frogs = try loadFrogs()
        } catch {
            print(error)
        }
        
        collectionView.reloadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return frogs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "frog", for: indexPath) as? FrogCollectionViewCell else { fatalError() }
        cell.configure(with: frogs[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row < frogs.count else { return }
        let frog = frogs[indexPath.row]
        guard let song = frog.song else { fatalError("\(frog.name) is missing a call: \(frog.song) does not exist") }
        do {
            try Player.shared.play(song)
        } catch {
            print(error)
        }
    }
}

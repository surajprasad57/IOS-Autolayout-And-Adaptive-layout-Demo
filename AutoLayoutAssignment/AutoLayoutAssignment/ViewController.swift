//
//  ViewController.swift
//  AutoLayoutAssignment
//
//  Created by Suraj Prasad on 04/03/19.
//  Copyright © 2019 Suraj Prasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var rowNo = 0
    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var hotelAddress: UILabel!
    @IBOutlet weak var stars: UIImageView!
    let foodNames = ["Special Egg Dish","Pizza Combo","Pizza Italiano","Veggie Mega Burger","Mc French Fries","Non-Veg Special","Mix Salad","Special Egg Dish","Pizza Combo","Pizza Italiano","Veggie Mega Burger","Mc French Fries","Non-Veg Special","Mix Salad"]
    let foodImages = ["food1","food2","food3","food4","food5","food6","food7","food1","food2","food3","food4","food5","food6","food7"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell {
            cell.gridFoodName.text = foodNames[indexPath.row]
            cell.gridFoodImage.image = UIImage(named:foodImages[indexPath.row])
            
            let tapImage = UITapGestureRecognizer(target: self, action: #selector(tapImageAction(_:)))
            tapImage.numberOfTapsRequired = 1
            cell.gridFoodImage.addGestureRecognizer(tapImage)
            return cell
            
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionView.frame.width)
        return CGSize(width:view.frame.width/2-4, height: 220)
    }
    @objc func tapImageAction(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("Image tapped")
            let location = sender.location(in: collectionView)
            if let indexPath = collectionView.indexPathForItem(at: location) {
                print("tapped row \(indexPath.row)")
                self.rowNo = indexPath.row
            }
            performSegue(withIdentifier:"ImageDisplayVC", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ImageDisplayVC {
        vc.cellImage = UIImage(named: foodImages[rowNo])
    }
}
}

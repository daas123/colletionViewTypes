//
//  ViewController.swift
//  colletionViewTypes
//
//  Created by Neosoft on 02/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageCollView: UICollectionView!
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollView.delegate = self
        imageCollView.dataSource = self
        viewConfigrations()
    }
    private func viewConfigrations() {
        imageCollView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        centeredCollectionViewFlowLayout = (imageCollView.collectionViewLayout as! CenteredCollectionViewFlowLayout)
        
        centeredCollectionViewFlowLayout.itemSize = CGSize(width: imageCollView.bounds.width * 0.65, height: imageCollView.bounds.height)

        imageCollView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        centeredCollectionViewFlowLayout.minimumLineSpacing = 10
        
        imageCollView.showsHorizontalScrollIndicator = false
    }

}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.cellImage.image = UIImage(named: "download")
        return cell
    }
    
}

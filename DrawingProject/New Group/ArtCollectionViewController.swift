//
//  ArtCollectionViewController.swift
//  DrawingProject
//
//  Created by Bonilla, Sean on 11/7/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ArtIdentifier"

public class ArtCollectionViewController: UICollectionViewController {
    
    //MARK: Data memebers for Creativity Screen
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRowCompact: CGFloat = 4
    private let itemsPerRowNormal: CGFloat = 6
    
    private let creativeCS: [UIImage?] =
    {
        return[
            UIImage(named: "HaikuJava"),
            UIImage(named: "MACHU-PERU"),
            UIImage(named: "MainframeImg"),
            UIImage(named: "mlgsetup"),
            UIImage(named: "octocat"),
            UIImage(named: "Screen Shot 2018-11-07 at 7.59.00 AM"),
            UIImage(named: "servercabling"),
            UIImage(named: "SwiftHaikuFile"),
            UIImage(named: "THEPIC")
        ]
    }()
    
    private let Labels : [String] =
    {
        return [
             "JavaHiku",
            "Peru",
            "ServerHiku",
            "DeskImg",
            "Octocat",
            "App",
            "Cabling",
            "Swift",
            "THEPIC"
        ]
    }()
    
    //MARK: Navigation
    
    
    public override func viewDidLoad() -> Void
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    public override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return creativeCS.count
    }

    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ArtCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCell
    
        ArtCell.backgroundColor = .purple
        ArtCell.artImage.image = creativeCS[indexPath.row]
        ArtCell.artLabel.text = Labels[indexPath.row]
        // Configure the cell
    
        return ArtCell
    }

    // MARK: UICollectionViewDelegate

    public override func collectionView(_ collectionsView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let imageView = UIImageView(image: creativeCS[indexPath.row])
        imageView.frame = self.view.frame
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        imageView.addGestureRecognizer(tap)
        
        self.view.addSubview(imageView)
    }
    
    @objc
    private func dismissFullscreenImage(_ sender: UITapGestureRecognizer){
        sender.view?.removeFromSuperview()
    }
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRowCompact + 2)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRowCompact
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    // Uncomment this method to specify if the specified item should be selected
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> UIEdgeInsets {
        
        return sectionInsets
    }
}
